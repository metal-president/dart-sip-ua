import '../sip_ua.dart';
import 'constants.dart' as DartSIP_C;
import 'constants.dart';
import 'sip_message.dart';
import 'transport.dart';
import 'ua.dart';
import 'utils.dart' as Utils;
import 'logger.dart';
import 'transactions/invite_server.dart';
import 'transactions/non_invite_server.dart';

// Checks for requests and responses.
const all = [minimumHeaders];

// Checks for requests.
const requests = [
  rfc3261_8_2_2_1,
  rfc3261_16_3_4,
  rfc3261_18_3_request,
  rfc3261_8_2_2_2
];

// Checks for responses.
const responses = [rfc3261_8_1_3_3, rfc3261_18_3_response];

// local variables.
IncomingMessage message;
UA ua;
Transport transport;

bool sanityCheck(IncomingMessage m, UA u, Transport t) {
  message = m;
  ua = u;
  transport = t;

  for (var check in all) {
    if (check() == false) {
      return false;
    }
  }

  if (message is IncomingRequest) {
    for (var check in requests) {
      if (check() == false) {
        return false;
      }
    }
  } else if (message is IncomingResponse) {
    for (var check in responses) {
      if (check() == false) {
        return false;
      }
    }
  }

  // Everything is OK.
  return true;
}

/*
 * Sanity Check for incoming Messages
 *
 * Requests:
 *  - _rfc3261_8_2_2_1_ Receive a Request with a non supported URI scheme
 *  - _rfc3261_16_3_4_ Receive a Request already sent by us
 *   Does not look at via sent-by but at jssip_id, which is inserted as
 *   a prefix in all initial requests generated by the ua
 *  - _rfc3261_18_3_request_ Body Content-Length
 *  - _rfc3261_8_2_2_2_ Merged Requests
 *
 * Responses:
 *  - _rfc3261_8_1_3_3_ Multiple Via headers
 *  - _rfc3261_18_3_response_ Body Content-Length
 *
 * All:
 *  - Minimum headers in a SIP message
 */

// Sanity Check functions for requests.
bool rfc3261_8_2_2_1() {
  if (message.s('to').uri.scheme != 'sip') {
    reply(416);

    return false;
  }

  return true;
}

bool rfc3261_16_3_4() {
  if (message.to_tag == null) {
    if (message.call_id.substring(0, 5) == ua.configuration.jssip_id) {
      reply(482);

      return false;
    }
  }
  return true;
}

bool rfc3261_18_3_request() {
  var len = Utils.str_utf8_length(message.body);
  var contentLength = message.getHeader('content-length');

  if (contentLength is String) {
    contentLength = int.tryParse(contentLength) ?? 0;
  }

  if (len < contentLength) {
    reply(400);

    return false;
  }

  return true;
}

bool rfc3261_8_2_2_2() {
  var fromTag = message.from_tag;
  var call_id = message.call_id;
  var cseq = message.cseq;

  // Accept any in-dialog request.
  if (message.to_tag != null) {
    return true;
  }

  // INVITE request.
  if (message.method == SipMethod.INVITE) {
    // If the branch matches the key of any IST then assume it is a retransmission
    // and ignore the INVITE.
    // TODO: we should reply the last response.
    if (ua.transactions
            .getTransaction(InviteServerTransaction, message.via_branch) !=
        null) {
      return false;
    }
    // Otherwise check whether it is a merged request.
    else {
      ua.transactions.getAll(InviteServerTransaction).forEach((tr) {
        if (tr._request.from_tag == fromTag &&
            tr._request.call_id == call_id &&
            tr._request.cseq == cseq) {
          reply(482);

          return false;
        }
      });
    }
  }

  // Non INVITE request.

  // If the branch matches the key of any NIST then assume it is a retransmission
  // and ignore the request.
  // TODO: we should reply the last response.
  else if (ua.transactions
          .getTransaction(NonInviteServerTransaction, message.via_branch) !=
      null) {
    return false;
  }

  // Otherwise check whether it is a merged request.
  else {
    ua.transactions.getAll(NonInviteServerTransaction).forEach((tr) {
      if (tr._request.from_tag == fromTag &&
          tr._request.call_id == call_id &&
          tr._request.cseq == cseq) {
        reply(482);
        return false;
      }
    });
  }

  return true;
}

// Sanity Check functions for responses.
bool rfc3261_8_1_3_3() {
  if (message.getHeaders('via').length > 1) {
    logger.debug(
        'more than one Via header field present in the response, dropping the response');

    return false;
  }
  return true;
}

bool rfc3261_18_3_response() {
  var len = Utils.str_utf8_length(message.body);
  var contentLength = message.getHeader('content-length');

  if (contentLength is String) {
    contentLength = int.tryParse(contentLength) ?? 0;
  }

  if (len < contentLength) {
    logger.debug(
        'message body length is lower than the value in Content-Length header field, dropping the response');

    return false;
  }

  return true;
}

// Sanity Check functions for requests and responses.
bool minimumHeaders() {
  var mandatoryHeaders = ['from', 'to', 'call_id', 'cseq', 'via'];

  for (var header in mandatoryHeaders) {
    if (!message.hasHeader(header)) {
      logger.debug(
          'missing mandatory header field : ${header}, dropping the response');

      return false;
    }
  }

  return true;
}

// Reply.
void reply(status_code) {
  var vias = message.getHeaders('via');

  var to;
  var response =
      'SIP/2.0 ${status_code} ${DartSIP_C.REASON_PHRASE[status_code]}\r\n';

  for (var via in vias) {
    response += 'Via: ${via}\r\n';
  }

  to = message.getHeader('To');

  if (message.to_tag == null) {
    to += ';tag=${Utils.newTag()}';
  }

  response += 'To: ${to}\r\n';
  response += 'From: ${message.getHeader('From')}\r\n';
  response += 'Call-ID: ${message.call_id}\r\n';
  response +=
      'CSeq: ${message.cseq} ${SipMethodHelper.getName(message.method)}\r\n';
  response += '\r\n';

  transport.send(response);
}
