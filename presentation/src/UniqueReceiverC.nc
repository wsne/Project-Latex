#if (RECEIVE_HISTORY_SIZE > 0)
  components UniqueReceiveP,
      CC2420PacketC,
      MainC;
  
  Receive = UniqueReceiveP.Receive;
  DuplicateReceive = UniqueReceiveP.DuplicateReceive;
  SubReceive = UniqueReceiveP.SubReceive;
  MainC.SoftwareInit -> UniqueReceiveP;
  UniqueReceiveP.CC2420PacketBody -> CC2420PacketC;
  
#else 
  components DummyReceiveP;
  DuplicateReceive = DummyReceiveP;
  Receive = SubReceive;
#endif
