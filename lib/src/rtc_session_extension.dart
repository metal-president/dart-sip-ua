import 'rtc_session.dart';

// for Comdesk
extension RtcSessionExtension on RTCSession {

}

  // onAccountNotFound(data) {
  //   this.log(data);
  //   this.dispatch(this.EVENT_TYPE.ON_ACCOUNT_NOT_FOUND, data);
  // }

  // onAccountFound(data) {
  //   this.log(data);
  //   this.dispatch(this.EVENT_TYPE.ON_ACCOUNT_FOUND, data);
  //   const { sip_host, sip_username } = data;
  //   const { isUnregisterMode } = this.options;
  //   this.pbxServerHost = sip_host;
  //   this.sipUsername = sip_username;
  //   this.setMyUserData(data);
  //   this.setUAOptions(data);
  //   this.UA = new SIP.UA(this.UAOptions);
  //   this.UA.on('registered', this.onUARegistered.bind(this));
  //   this.UA.on('unregistered', this.onUAUnRegistered.bind(this));
  //   this.UA.on('invite', this.onBeingInvited.bind(this));
  //   this.UA.on('message', this.onSipMessage.bind(this));
  //   this.log(this.EVENT_TYPE.ON_UA_PREPARED);
  //   this.log({ ua: this.UA });
  //   this.dispatch(this.EVENT_TYPE.ON_UA_PREPARED, { ua: this.UA });
  //   if (isUnregisterMode) {
  //     this.setUAStatus(this.UA_STATUS.WATING);
  //   }
  //   this.prepareSubscribe();
  // }

  // prepareSubscribe() {
  //   this.subscribeHost = this.changeDomainSuffix(this.pbxServerHost, '-ami.comdesk.com');
  //   if (this.subscribeHost) { this.createSubscribeSocket(); }
  // }

  // createSubscribeSocket() {
  //   this.subscribeSocket = io(`https://${this.subscribeHost}:${this.subscribeServerPort}`);
  //   this.bindSubscribeEvents();
  // }

  // bindSubscribeEvents() {
  //   const { isUserSubscribeOn, isQueueSubscribeOn } = this.options;
  //   this.subscribeSocket.on('connect', this.onSubscribeConnect.bind(this));
  //   this.subscribeSocket.on('disconnect', this.onSubscribeDisconnect.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.WHO_ARE_YOU, this.onWhoAreYou.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.JOINED_ROOM, this.onJoinedRoom.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.GOT_YOUR_NEW_CHANNEL, this.onGotMyNewInvitingChannel.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.SUCCESSFULLY_QUEUED_TO_PARK, this.onSuccessfillyQueuedToPark.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.THIS_PARK_NUMBER_IS_BUSY, this.onThisParkNumberIsBusy.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.PARK_START, this.onParkStart.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.PARK_END, this.onParkEnd.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.GOT_ALL_USED_PARK_SPACE, this.onGotAllUsedParkSpace.bind(this));
  //   this.subscribeSocket.on(this.RECEIVE_EVENT.GOT_THREEWAY_CHANNEL, this.onGotThreewayChannel.bind(this));
  //   if (isUserSubscribeOn) {
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.USER_STATE_CHANGE, this.onUserStateChange.bind(this));
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.HOLD_STATE_CHANGE, this.onHoldStateChange.bind(this));
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.THREEWAY_STATE_CHANGE, this.onThreewayStateChange.bind(this));
  //   }
  //   if (isQueueSubscribeOn) {
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.QUEUE_INFO, this.onQueueInfo.bind(this));
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.QUEUE_CALLER_JOIN, this.onQueueCallerJoin.bind(this));
  //     this.subscribeSocket.on(this.RECEIVE_EVENT.QUEUE_CALLER_LEAVE, this.onQueueCallerLeave.bind(this));
  //   }
  // }

  // bindWebSocketEvents() {
  //   const { transport } = this.UA;
  //   const { ws } = transport;
  //   ws.addEventListener('open', this.onWebSocketOpen.bind(this));
  //   ws.addEventListener('close', this.onWebSocketClose.bind(this));
  // }

  // onWebSocketOpen() {
  //   this.log('onWebSocketOpen');
  // }

  // onWebSocketClose() {
  //   this.log('onWebSocketClose');
  // }

  // onSubscribeConnect() {
  //   const { isUserSubscribeOn, isQueueSubscribeOn } = this.options;
  //   this.prepareParkSubscribe();
  //   if (isUserSubscribeOn) { this.prepareUsersSubscribe(); }
  //   if (isQueueSubscribeOn) { this.prepareQueuesSubscribe(); }
  // }

  // onWhoAreYou(data) {
  //   const { id } = data;
  //   this.subscribeSocketId = id;
  //   const { managers_id, accounts_id } = this.MyUserData;
  //   this.emitSubscribeSocket(this.SEND_EVENT.I_AM_THIS, { id, managers_id, accounts_id });
  // }

  // onJoinedRoom(data) {
  //   const { manager_room_name, account_room_name } = data;
  //   this.log(`Joined the subscribe-room(${manager_room_name}).`);
  //   this.log(`Joined the subscribe-room(${account_room_name}).`);
  // }

  // onGotMyNewInvitingChannel(data) {
  //   const { channel } = data;
  //   this.lastMyChannel = channel;
  // }

  // onSuccessfillyQueuedToPark(data) {
  //   const { number } = data;
  //   this.dispatch(this.EVENT_TYPE.ON_SUCCESSFULLY_QUEUED_TO_PARK, { number });
  // }

  // onThisParkNumberIsBusy(data) {
  //   const { number } = data;
  //   this.dispatch(this.EVENT_TYPE.ON_THIS_PARK_NUMBER_IS_BUSY, { number });
  // }

  // onParkStart(data) {
  //   const { number } = data;
  //   this.dispatch(this.EVENT_TYPE.ON_PARK_START, { number });
  // }

  // onParkEnd(data) {
  //   const { number } = data;
  //   this.dispatch(this.EVENT_TYPE.ON_PARK_END, { number });
  // }

  // onGotAllUsedParkSpace(data) {
  //   const { spaces } = data;
  //   this.dispatch(this.EVENT_TYPE.ON_GOT_ALL_USED_PARK_SPACE, { spaces });
  // }

  // onGotThreewayChannel(data) {
  //   const { threeway_channel } = data;
  //   this.threewayChannel = threeway_channel
  // }

  // onUserStateChange(data) {
  //   const { account_name, state, has_device } = data;
  //   if (this.usersForSubscribe[account_name]) {
  //     const user = this.usersForSubscribe[account_name];
  //     // 状態が変わっていないイベントがサーバから送られてくるのでチェックする
  //     if (user.state == state) {
  //       console.log('skip dispatch (user state is not changed)');
  //       return;
  //     }
  //     this.usersForSubscribe[account_name].state = state;
  //     user.state = state;
  //     user.hasDevice = has_device;
  //     this.dispatch(this.EVENT_TYPE.ON_USER_STATE_CHANGE, { user });
  //   }
  // }

  // onHoldStateChange(data) {
  //   const { account_name, state } = data;
  //   if (this.usersForSubscribe[account_name]) {
  //     const user = this.usersForSubscribe[account_name];
  //     user.state = state;
  //     this.dispatch(this.EVENT_TYPE.ON_HOLD_STATE_CHANGE, { user });
  //   }
  // }

  // onThreewayStateChange(data) {
  //   const {
  //     account_name,
  //     threeway_state,
  //     threeway_channel,
  //     bridge_uniqueid
  //   } = data;
  //   if (this.usersForSubscribe[account_name]) {
  //     const user = {...this.usersForSubscribe[account_name]};
  //     if (threeway_state === this.THREEWAY_STATE.TALKING || threeway_state === this.THREEWAY_STATE.HANGUP_FIRST_CALLER) {
  //       user.threewayState = threeway_state
  //       this.dispatch(this.EVENT_TYPE.ON_THREEWAY_STATE_CHANGE, { user });
  //     }
  //     if (threeway_state === this.THREEWAY_STATE.HANGUP) {
  //       user.threewayState = threeway_state
  //       user.threewayBridgeUniqueid = bridge_uniqueid
  //       this.dispatch(this.EVENT_TYPE.ON_THREEWAY_STATE_CHANGE, { user });
  //     }
  //     if (threeway_state === this.THREEWAY_STATE.BEGAN) {
  //       this.threewayState = threeway_state
  //       this.threewayChannel = threeway_channel
  //       this.threewayBridgeUniqueid = bridge_uniqueid
  //     }
  //     if (this.threewayBridgeUniqueid === bridge_uniqueid) {
  //       this.threewayState = threeway_state
  //       user.threewayState = threeway_state
  //       user.threewayChannel = threeway_channel
  //       user.threewayBridgeUniqueid = bridge_uniqueid
  //       this.dispatch(this.EVENT_TYPE.ON_THREEWAY_STATE_CHANGE, { user });
  //     }
  //   }
  // }

  // onQueueInfo(data) {
  //   const { queue_name, calls } = data;
  //   if (this.queuesForSubscribe[queue_name]) {
  //     const queue = this.queuesForSubscribe[queue_name];
  //     queue.calls = calls;
  //     this.dispatch(this.EVENT_TYPE.ON_QUEUE_INFO, { queue });
  //   }
  // }

  // onQueueCallerJoin(data) {
  //   const { queue_name/*, caller_id_num, caller_id_name, position*/, calls } = data;
  //   if (this.queuesForSubscribe[queue_name]) {
  //     const queue = this.queuesForSubscribe[queue_name];
  //     /*
  //     queue.caller_id_num = caller_id_num;
  //     queue.caller_id_name = caller_id_name;
  //     queue.position = position;
  //     */
  //     queue.calls = calls;
  //     this.dispatch(this.EVENT_TYPE.ON_QUEUE_CALLER_JOIN, { queue });
  //   }
  // }

  // onQueueCallerLeave(data) {
  //   const { queue_name/*, caller_id_num, caller_id_name, position*/, calls } = data;
  //   if (this.queuesForSubscribe[queue_name]) {
  //     const queue = this.queuesForSubscribe[queue_name];
  //     /*
  //     queue.caller_id_num = caller_id_num;
  //     queue.caller_id_name = caller_id_name;
  //     queue.position = position;
  //     */
  //     queue.calls = calls;
  //     this.dispatch(this.EVENT_TYPE.ON_QUEUE_CALLER_LEAVE, { queue });
  //   }
  // }

  // onSubscribeDisconnect() {
  //   this.subscribeSocketId = '';
  // }

  // prepareParkSubscribe() {
  //   const { hypers_id, supers_id, managers_id } = this.MyUserData;
  //   this.emitSubscribeSocket(this.SEND_EVENT.GIVE_ME_ALL_USED_PARK_SPACE, { hypers_id, supers_id, managers_id });
  // }

  // prepareUsersSubscribe() {
  //   this.getAllUsersForSubscribe().then((users) => {
  //     if (users.length > 0) {
  //       const self = this;
  //       let accounts = [];
  //       users.forEach(user => {
  //         const { key, name, number, email, account_name } = user;
  //         self.usersForSubscribe[account_name] = { key, name, number, email };
  //         accounts.push(account_name);
  //       });
  //       this.emitSubscribeSocket(this.SEND_EVENT.GIVE_ME_CURRENT_USERS_STATUS, { accounts });
  //     }
  //   });
  // }

  // prepareQueuesSubscribe() {
  //   this.getAllQueuesForSubscribe().then((queues) => {
  //     if (queues.length > 0) {
  //       const self = this;
  //       let queueNames = [];
  //       queues.forEach(queue => {
  //         const { queue_key, queue_name_for_subscribe, queue_name, queue_description, group_name, group_key } = queue;
  //         self.queuesForSubscribe[queue_name_for_subscribe] = { queue_key, queue_name, queue_description, group_name, group_key };
  //         queueNames.push(queue_name_for_subscribe);
  //       });
  //       this.emitSubscribeSocket(this.SEND_EVENT.GIVE_ME_CURRENT_QUEUES_STATUS, { queues: queueNames });
  //     }
  //   });
  // }

  // emitSubscribeSocket(eventName, params) {
  //   if (!this.subscribeSocket) { return; }
  //   this.log(`Send ${eventName} to subscribe socket with params below:`);
  //   this.log(params);
  //   this.subscribeSocket.emit(eventName, params);
  // }

  // getAllUsersForSubscribe() {
  //   const self = this;
  //   return new Promise((resolve, reject) => {
  //     const { manager_key, api_url } = self.options;
  //     const apiUrl = `${api_url}${self.getAllUsersForSubscribeApiUri}`;
  //     const params = { key: manager_key };
  //     AJAX
  //       .post(apiUrl)
  //       .send(params)
  //       .end((err, res) => {
  //         if (!err) {
  //           let isError = true;
  //           if (res) {
  //             const { body } = res;
  //             if (body) {
  //               const { codes, result, users } = body;
  //               if (result && codes.length === 0) {
  //                 isError = false
  //                 resolve(users);
  //               }
  //             }
  //           }
  //           if (isError) {
  //             reject(res);
  //           }
  //         } else { reject(err); }
  //       });
  //   });
  // }

  // getAllQueuesForSubscribe() {
  //   const self = this;
  //   return new Promise((resolve, reject) => {
  //     const { manager_key, api_url } = self.options;
  //     const apiUrl = `${api_url}${self.getAllQueuesForSubscribeApiUri}`;
  //     const params = { key: manager_key };
  //     AJAX
  //       .post(apiUrl)
  //       .send(params)
  //       .end((err, res) => {
  //         if (!err) {
  //           let isError = true;
  //           if (res) {
  //             const { body } = res;
  //             if (body) {
  //               const { codes, result, queues } = body;
  //               if (result && codes.length === 0) {
  //                 isError = false
  //                 resolve(queues);
  //               }
  //             }
  //           }
  //           if (isError) {
  //             reject(res);
  //           }
  //         } else { reject(err); }
  //       });
  //   });
  // }

  // setMyUserData(onAccountFoundData) {
  //   const data = onAccountFoundData;
  //   const keys = ['hypers_id', 'supers_id', 'managers_id', 'users_id', 'accounts_id', 'name', 'number', 'key'];
  //   const numberColumns = ['hypers_id', 'supers_id', 'managers_id', 'users_id', 'accounts_id'];
  //   keys.forEach(((key) => {
  //     if (data[key]) {
  //       if (numberColumns.indexOf(key) !== -1) {
  //         this.MyUserData[key] = Number(data[key]);
  //       } else {
  //         this.MyUserData[key] = data[key];
  //       }
  //     }
  //   }));
  //   this.log(this.MyUserData);
  // }

  // setUAOptions(onAccountFoundData) {
  //   const data = onAccountFoundData;
  //   const { sip_username, sip_password, sip_host } = data;
  //   let lastSipHost = this.changeDomainSuffix(sip_host, '-18089.comdesk.com');
  //   this.asteriskHost = lastSipHost;
  //   const uri = `${sip_username}@${lastSipHost}`;
  //   const iceServers = this.getIceServers(data);
  //   this.log(iceServers);
  //   const additionalUAOptions = {
  //     uri,
  //     //wsServers: [`wss://${lastSipHost}:${this.pbxHttpsPort}${this.pbxWssUri}`],
  //     authorizationUser: sip_username,
  //     password: sip_password,
  //     //registrarServer: `sip:${lastSipHost}`,
  //     displayName: sip_username,
  //     userAgentString: sip_username,
  //     sessionDescriptionHandlerFactoryOptions: {
  //       constraints: {
  //         audio: {
  //           advanced: [{
  //             echoCancellation: {
  //               exact: true
  //             }
  //           }, {
  //             googEchoCancellation: {
  //               exact: true
  //             }
  //           }, {
  //             googExperimentalEchoCancellation: {
  //               exact: true
  //             }
  //           }, {
  //             googNoiseSuppression: {
  //               exact: true
  //             }
  //           }, {
  //             googExperimentalNoiseSuppression: {
  //               exact: true
  //             }
  //           }, {
  //             googAutoGainControl: {
  //               exact: true
  //             }
  //           }, {
  //             googExperimentalAutoGainControl: {
  //               exact: true
  //             }
  //           }, {
  //             googHighpassFilter: {
  //               exact: true
  //             }
  //           }, {
  //             googTypingNoiseDetection: {
  //               exact: true
  //             }
  //           }, {
  //             googAudioMirroring: {
  //               exact: false
  //             }
  //           }, {
  //             deviceId: {
  //               exact: ["default"]
  //             }
  //           }]
  //         },
  //         video: false
  //       },
  //       iceCheckingTimeout: this.iceCheckingTimeout,
  //       alwaysAcquireMediaFirst: false,
  //       peerConnectionOptions: {
  //         rtcConfiguration: { iceServers },
  //         iceCheckingTimeout: this.iceCheckingTimeout
  //       }
  //     }
  //   };
  //   if (this.browser === this.BROWSER.CHROME) {
  //     additionalUAOptions
  //       .sessionDescriptionHandlerFactoryOptions
  //       .peerConnectionOptions
  //       .rtcConfiguration
  //       .rtcpMuxPolicy = 'require';
  //   } else if (this.browser === this.BROWSER.CROSSWALK) {
  //     additionalUAOptions
  //       .sessionDescriptionHandlerFactoryOptions
  //       .peerConnectionOptions
  //       .rtcConfiguration
  //       .rtcpMuxPolicy = 'negotiate';
  //   }
  //   this.UAOptions.registerOptions.registrar = `sip:${lastSipHost}`;
  //   this.UAOptions.transportOptions.wsServers = [`wss://${lastSipHost}:${this.pbxHttpsPort}${this.pbxWssUri}`];
  //   Object.keys(additionalUAOptions).forEach((key) => {
  //     this.UAOptions[key] = additionalUAOptions[key];
  //   });
  // }

  // getIceServers(onAccountFoundData) {
  //   let iceServers = [];
  //   const data = onAccountFoundData;
  //   const { sip_host, turn_username, turn_password } = data;
  //   const { withUdpIce } = this.options;
  //   iceServers.push({
  //     urls: `turn:${sip_host}:${this.iceServerPort}?transport=tcp`,
  //     username: turn_username,
  //     credential: turn_password
  //   });
  //   if (withUdpIce) {
  //     this.log(this.MSG.WITH_UDP_ICE);
  //     iceServers.push({
  //       urls: `turn:${sip_host}:${this.iceServerPort}?transport=udp`,
  //       username: turn_username,
  //       credential: turn_password
  //     });
  //   }
  //   return iceServers;
  // }

  // setUAStatus(UAStatus) {
  //   this.UAStatus = UAStatus;
  //   this.dispatch(this.EVENT_TYPE.ON_UA_STATE_CHANGE, { UAStatus });
  // }

  // isUAPrepared() {
  //   let rtn = false;
  //   if (this.UA) {
  //     rtn = true;
  //   }
  //   return rtn;
  // }

  // getSipUserName() {
  //   let rtn = '';
  //   if (this.sipUsername) {
  //     rtn = this.sipUsername;
  //   }
  //   return rtn;
  // }
