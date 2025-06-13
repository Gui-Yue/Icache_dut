module ICache_top();

  logic  clock;
  logic  reset;
  logic  auto_ctrlUnitOpt_in_a_ready;
  logic  auto_ctrlUnitOpt_in_a_valid;
  logic [3:0] auto_ctrlUnitOpt_in_a_bits_opcode;
  logic [1:0] auto_ctrlUnitOpt_in_a_bits_size;
  logic [2:0] auto_ctrlUnitOpt_in_a_bits_source;
  logic [29:0] auto_ctrlUnitOpt_in_a_bits_address;
  logic [7:0] auto_ctrlUnitOpt_in_a_bits_mask;
  logic [63:0] auto_ctrlUnitOpt_in_a_bits_data;
  logic  auto_ctrlUnitOpt_in_d_ready;
  logic  auto_ctrlUnitOpt_in_d_valid;
  logic [3:0] auto_ctrlUnitOpt_in_d_bits_opcode;
  logic [1:0] auto_ctrlUnitOpt_in_d_bits_size;
  logic [2:0] auto_ctrlUnitOpt_in_d_bits_source;
  logic [63:0] auto_ctrlUnitOpt_in_d_bits_data;
  logic  auto_client_out_a_ready;
  logic  auto_client_out_a_valid;
  logic [3:0] auto_client_out_a_bits_source;
  logic [47:0] auto_client_out_a_bits_address;
  logic  auto_client_out_d_valid;
  logic [3:0] auto_client_out_d_bits_opcode;
  logic [2:0] auto_client_out_d_bits_size;
  logic [3:0] auto_client_out_d_bits_source;
  logic [255:0] auto_client_out_d_bits_data;
  logic  auto_client_out_d_bits_corrupt;
  logic [5:0] io_hartId;
  logic  io_fetch_req_ready;
  logic  io_fetch_req_valid;
  logic [49:0] io_fetch_req_bits_pcMemRead_0_startAddr;
  logic [49:0] io_fetch_req_bits_pcMemRead_0_nextlineStart;
  logic [49:0] io_fetch_req_bits_pcMemRead_1_startAddr;
  logic [49:0] io_fetch_req_bits_pcMemRead_1_nextlineStart;
  logic [49:0] io_fetch_req_bits_pcMemRead_2_startAddr;
  logic [49:0] io_fetch_req_bits_pcMemRead_2_nextlineStart;
  logic [49:0] io_fetch_req_bits_pcMemRead_3_startAddr;
  logic [49:0] io_fetch_req_bits_pcMemRead_3_nextlineStart;
  logic [49:0] io_fetch_req_bits_pcMemRead_4_startAddr;
  logic [49:0] io_fetch_req_bits_pcMemRead_4_nextlineStart;
  logic  io_fetch_req_bits_readValid_0;
  logic  io_fetch_req_bits_readValid_1;
  logic  io_fetch_req_bits_readValid_2;
  logic  io_fetch_req_bits_readValid_3;
  logic  io_fetch_req_bits_readValid_4;
  logic  io_fetch_req_bits_backendException;
  logic  io_fetch_resp_valid;
  logic  io_fetch_resp_bits_doubleline;
  logic [49:0] io_fetch_resp_bits_vaddr_0;
  logic [49:0] io_fetch_resp_bits_vaddr_1;
  logic [511:0] io_fetch_resp_bits_data;
  logic [47:0] io_fetch_resp_bits_paddr_0;
  logic [1:0] io_fetch_resp_bits_exception_0;
  logic [1:0] io_fetch_resp_bits_exception_1;
  logic  io_fetch_resp_bits_pmp_mmio_0;
  logic  io_fetch_resp_bits_pmp_mmio_1;
  logic [1:0] io_fetch_resp_bits_itlb_pbmt_0;
  logic [1:0] io_fetch_resp_bits_itlb_pbmt_1;
  logic  io_fetch_resp_bits_backendException;
  logic [55:0] io_fetch_resp_bits_gpaddr;
  logic  io_fetch_resp_bits_isForVSnonLeafPTE;
  logic  io_fetch_topdownIcacheMiss;
  logic  io_fetch_topdownItlbMiss;
  logic  io_ftqPrefetch_req_ready;
  logic  io_ftqPrefetch_req_valid;
  logic [49:0] io_ftqPrefetch_req_bits_startAddr;
  logic [49:0] io_ftqPrefetch_req_bits_nextlineStart;
  logic  io_ftqPrefetch_req_bits_ftqIdx_flag;
  logic [5:0] io_ftqPrefetch_req_bits_ftqIdx_value;
  logic  io_ftqPrefetch_flushFromBpu_s2_valid;
  logic  io_ftqPrefetch_flushFromBpu_s2_bits_flag;
  logic [5:0] io_ftqPrefetch_flushFromBpu_s2_bits_value;
  logic  io_ftqPrefetch_flushFromBpu_s3_valid;
  logic  io_ftqPrefetch_flushFromBpu_s3_bits_flag;
  logic [5:0] io_ftqPrefetch_flushFromBpu_s3_bits_value;
  logic [1:0] io_ftqPrefetch_backendException;
  logic  io_softPrefetch_0_valid;
  logic [49:0] io_softPrefetch_0_bits_vaddr;
  logic  io_softPrefetch_1_valid;
  logic [49:0] io_softPrefetch_1_bits_vaddr;
  logic  io_softPrefetch_2_valid;
  logic [49:0] io_softPrefetch_2_bits_vaddr;
  logic  io_stop;
  logic  io_toIFU;
  logic [47:0] io_pmp_0_req_bits_addr;
  logic  io_pmp_0_resp_instr;
  logic  io_pmp_0_resp_mmio;
  logic [47:0] io_pmp_1_req_bits_addr;
  logic  io_pmp_1_resp_instr;
  logic  io_pmp_1_resp_mmio;
  logic [47:0] io_pmp_2_req_bits_addr;
  logic  io_pmp_2_resp_instr;
  logic  io_pmp_2_resp_mmio;
  logic [47:0] io_pmp_3_req_bits_addr;
  logic  io_pmp_3_resp_instr;
  logic  io_pmp_3_resp_mmio;
  logic  io_itlb_0_req_valid;
  logic [49:0] io_itlb_0_req_bits_vaddr;
  logic [47:0] io_itlb_0_resp_bits_paddr_0;
  logic [63:0] io_itlb_0_resp_bits_gpaddr_0;
  logic [1:0] io_itlb_0_resp_bits_pbmt_0;
  logic  io_itlb_0_resp_bits_miss;
  logic  io_itlb_0_resp_bits_isForVSnonLeafPTE;
  logic  io_itlb_0_resp_bits_excp_0_gpf_instr;
  logic  io_itlb_0_resp_bits_excp_0_pf_instr;
  logic  io_itlb_0_resp_bits_excp_0_af_instr;
  logic  io_itlb_1_req_valid;
  logic [49:0] io_itlb_1_req_bits_vaddr;
  logic [47:0] io_itlb_1_resp_bits_paddr_0;
  logic [63:0] io_itlb_1_resp_bits_gpaddr_0;
  logic [1:0] io_itlb_1_resp_bits_pbmt_0;
  logic  io_itlb_1_resp_bits_miss;
  logic  io_itlb_1_resp_bits_isForVSnonLeafPTE;
  logic  io_itlb_1_resp_bits_excp_0_gpf_instr;
  logic  io_itlb_1_resp_bits_excp_0_pf_instr;
  logic  io_itlb_1_resp_bits_excp_0_af_instr;
  logic  io_itlbFlushPipe;
  logic  io_error_valid;
  logic [47:0] io_error_bits_paddr;
  logic  io_error_bits_report_to_beu;
  logic  io_csr_pf_enable;
  logic  io_fencei;
  logic  io_flush;
  logic  io_perfInfo_only_0_hit;
  logic  io_perfInfo_only_0_miss;
  logic  io_perfInfo_hit_0_hit_1;
  logic  io_perfInfo_hit_0_miss_1;
  logic  io_perfInfo_miss_0_hit_1;
  logic  io_perfInfo_miss_0_miss_1;
  logic  io_perfInfo_hit_0_except_1;
  logic  io_perfInfo_miss_0_except_1;
  logic  io_perfInfo_except_0;
  logic  io_perfInfo_bank_hit_0;
  logic  io_perfInfo_bank_hit_1;
  logic  io_perfInfo_hit;
  logic  boreChildrenBd_bore_array;
  logic  boreChildrenBd_bore_all;
  logic  boreChildrenBd_bore_req;
  logic  boreChildrenBd_bore_ack;
  logic  boreChildrenBd_bore_writeen;
  logic [3:0] boreChildrenBd_bore_be;
  logic [7:0] boreChildrenBd_bore_addr;
  logic [147:0] boreChildrenBd_bore_indata;
  logic  boreChildrenBd_bore_readen;
  logic [7:0] boreChildrenBd_bore_addr_rd;
  logic [147:0] boreChildrenBd_bore_outdata;
  logic [3:0] boreChildrenBd_bore_1_array;
  logic  boreChildrenBd_bore_1_all;
  logic  boreChildrenBd_bore_1_req;
  logic  boreChildrenBd_bore_1_ack;
  logic  boreChildrenBd_bore_1_writeen;
  logic  boreChildrenBd_bore_1_be;
  logic [8:0] boreChildrenBd_bore_1_addr;
  logic [65:0] boreChildrenBd_bore_1_indata;
  logic  boreChildrenBd_bore_1_readen;
  logic [8:0] boreChildrenBd_bore_1_addr_rd;
  logic [65:0] boreChildrenBd_bore_1_outdata;
  logic [4:0] boreChildrenBd_bore_2_array;
  logic  boreChildrenBd_bore_2_all;
  logic  boreChildrenBd_bore_2_req;
  logic  boreChildrenBd_bore_2_ack;
  logic  boreChildrenBd_bore_2_writeen;
  logic  boreChildrenBd_bore_2_be;
  logic [8:0] boreChildrenBd_bore_2_addr;
  logic [65:0] boreChildrenBd_bore_2_indata;
  logic  boreChildrenBd_bore_2_readen;
  logic [8:0] boreChildrenBd_bore_2_addr_rd;
  logic [65:0] boreChildrenBd_bore_2_outdata;
  logic [4:0] boreChildrenBd_bore_3_array;
  logic  boreChildrenBd_bore_3_all;
  logic  boreChildrenBd_bore_3_req;
  logic  boreChildrenBd_bore_3_ack;
  logic  boreChildrenBd_bore_3_writeen;
  logic  boreChildrenBd_bore_3_be;
  logic [8:0] boreChildrenBd_bore_3_addr;
  logic [65:0] boreChildrenBd_bore_3_indata;
  logic  boreChildrenBd_bore_3_readen;
  logic [8:0] boreChildrenBd_bore_3_addr_rd;
  logic [65:0] boreChildrenBd_bore_3_outdata;
  logic [5:0] boreChildrenBd_bore_4_array;
  logic  boreChildrenBd_bore_4_all;
  logic  boreChildrenBd_bore_4_req;
  logic  boreChildrenBd_bore_4_ack;
  logic  boreChildrenBd_bore_4_writeen;
  logic  boreChildrenBd_bore_4_be;
  logic [8:0] boreChildrenBd_bore_4_addr;
  logic [65:0] boreChildrenBd_bore_4_indata;
  logic  boreChildrenBd_bore_4_readen;
  logic [8:0] boreChildrenBd_bore_4_addr_rd;
  logic [65:0] boreChildrenBd_bore_4_outdata;


 ICache ICache(
    .clock(clock),
    .reset(reset),
    .auto_ctrlUnitOpt_in_a_ready(auto_ctrlUnitOpt_in_a_ready),
    .auto_ctrlUnitOpt_in_a_valid(auto_ctrlUnitOpt_in_a_valid),
    .auto_ctrlUnitOpt_in_a_bits_opcode(auto_ctrlUnitOpt_in_a_bits_opcode),
    .auto_ctrlUnitOpt_in_a_bits_size(auto_ctrlUnitOpt_in_a_bits_size),
    .auto_ctrlUnitOpt_in_a_bits_source(auto_ctrlUnitOpt_in_a_bits_source),
    .auto_ctrlUnitOpt_in_a_bits_address(auto_ctrlUnitOpt_in_a_bits_address),
    .auto_ctrlUnitOpt_in_a_bits_mask(auto_ctrlUnitOpt_in_a_bits_mask),
    .auto_ctrlUnitOpt_in_a_bits_data(auto_ctrlUnitOpt_in_a_bits_data),
    .auto_ctrlUnitOpt_in_d_ready(auto_ctrlUnitOpt_in_d_ready),
    .auto_ctrlUnitOpt_in_d_valid(auto_ctrlUnitOpt_in_d_valid),
    .auto_ctrlUnitOpt_in_d_bits_opcode(auto_ctrlUnitOpt_in_d_bits_opcode),
    .auto_ctrlUnitOpt_in_d_bits_size(auto_ctrlUnitOpt_in_d_bits_size),
    .auto_ctrlUnitOpt_in_d_bits_source(auto_ctrlUnitOpt_in_d_bits_source),
    .auto_ctrlUnitOpt_in_d_bits_data(auto_ctrlUnitOpt_in_d_bits_data),
    .auto_client_out_a_ready(auto_client_out_a_ready),
    .auto_client_out_a_valid(auto_client_out_a_valid),
    .auto_client_out_a_bits_source(auto_client_out_a_bits_source),
    .auto_client_out_a_bits_address(auto_client_out_a_bits_address),
    .auto_client_out_d_valid(auto_client_out_d_valid),
    .auto_client_out_d_bits_opcode(auto_client_out_d_bits_opcode),
    .auto_client_out_d_bits_size(auto_client_out_d_bits_size),
    .auto_client_out_d_bits_source(auto_client_out_d_bits_source),
    .auto_client_out_d_bits_data(auto_client_out_d_bits_data),
    .auto_client_out_d_bits_corrupt(auto_client_out_d_bits_corrupt),
    .io_hartId(io_hartId),
    .io_fetch_req_ready(io_fetch_req_ready),
    .io_fetch_req_valid(io_fetch_req_valid),
    .io_fetch_req_bits_pcMemRead_0_startAddr(io_fetch_req_bits_pcMemRead_0_startAddr),
    .io_fetch_req_bits_pcMemRead_0_nextlineStart(io_fetch_req_bits_pcMemRead_0_nextlineStart),
    .io_fetch_req_bits_pcMemRead_1_startAddr(io_fetch_req_bits_pcMemRead_1_startAddr),
    .io_fetch_req_bits_pcMemRead_1_nextlineStart(io_fetch_req_bits_pcMemRead_1_nextlineStart),
    .io_fetch_req_bits_pcMemRead_2_startAddr(io_fetch_req_bits_pcMemRead_2_startAddr),
    .io_fetch_req_bits_pcMemRead_2_nextlineStart(io_fetch_req_bits_pcMemRead_2_nextlineStart),
    .io_fetch_req_bits_pcMemRead_3_startAddr(io_fetch_req_bits_pcMemRead_3_startAddr),
    .io_fetch_req_bits_pcMemRead_3_nextlineStart(io_fetch_req_bits_pcMemRead_3_nextlineStart),
    .io_fetch_req_bits_pcMemRead_4_startAddr(io_fetch_req_bits_pcMemRead_4_startAddr),
    .io_fetch_req_bits_pcMemRead_4_nextlineStart(io_fetch_req_bits_pcMemRead_4_nextlineStart),
    .io_fetch_req_bits_readValid_0(io_fetch_req_bits_readValid_0),
    .io_fetch_req_bits_readValid_1(io_fetch_req_bits_readValid_1),
    .io_fetch_req_bits_readValid_2(io_fetch_req_bits_readValid_2),
    .io_fetch_req_bits_readValid_3(io_fetch_req_bits_readValid_3),
    .io_fetch_req_bits_readValid_4(io_fetch_req_bits_readValid_4),
    .io_fetch_req_bits_backendException(io_fetch_req_bits_backendException),
    .io_fetch_resp_valid(io_fetch_resp_valid),
    .io_fetch_resp_bits_doubleline(io_fetch_resp_bits_doubleline),
    .io_fetch_resp_bits_vaddr_0(io_fetch_resp_bits_vaddr_0),
    .io_fetch_resp_bits_vaddr_1(io_fetch_resp_bits_vaddr_1),
    .io_fetch_resp_bits_data(io_fetch_resp_bits_data),
    .io_fetch_resp_bits_paddr_0(io_fetch_resp_bits_paddr_0),
    .io_fetch_resp_bits_exception_0(io_fetch_resp_bits_exception_0),
    .io_fetch_resp_bits_exception_1(io_fetch_resp_bits_exception_1),
    .io_fetch_resp_bits_pmp_mmio_0(io_fetch_resp_bits_pmp_mmio_0),
    .io_fetch_resp_bits_pmp_mmio_1(io_fetch_resp_bits_pmp_mmio_1),
    .io_fetch_resp_bits_itlb_pbmt_0(io_fetch_resp_bits_itlb_pbmt_0),
    .io_fetch_resp_bits_itlb_pbmt_1(io_fetch_resp_bits_itlb_pbmt_1),
    .io_fetch_resp_bits_backendException(io_fetch_resp_bits_backendException),
    .io_fetch_resp_bits_gpaddr(io_fetch_resp_bits_gpaddr),
    .io_fetch_resp_bits_isForVSnonLeafPTE(io_fetch_resp_bits_isForVSnonLeafPTE),
    .io_fetch_topdownIcacheMiss(io_fetch_topdownIcacheMiss),
    .io_fetch_topdownItlbMiss(io_fetch_topdownItlbMiss),
    .io_ftqPrefetch_req_ready(io_ftqPrefetch_req_ready),
    .io_ftqPrefetch_req_valid(io_ftqPrefetch_req_valid),
    .io_ftqPrefetch_req_bits_startAddr(io_ftqPrefetch_req_bits_startAddr),
    .io_ftqPrefetch_req_bits_nextlineStart(io_ftqPrefetch_req_bits_nextlineStart),
    .io_ftqPrefetch_req_bits_ftqIdx_flag(io_ftqPrefetch_req_bits_ftqIdx_flag),
    .io_ftqPrefetch_req_bits_ftqIdx_value(io_ftqPrefetch_req_bits_ftqIdx_value),
    .io_ftqPrefetch_flushFromBpu_s2_valid(io_ftqPrefetch_flushFromBpu_s2_valid),
    .io_ftqPrefetch_flushFromBpu_s2_bits_flag(io_ftqPrefetch_flushFromBpu_s2_bits_flag),
    .io_ftqPrefetch_flushFromBpu_s2_bits_value(io_ftqPrefetch_flushFromBpu_s2_bits_value),
    .io_ftqPrefetch_flushFromBpu_s3_valid(io_ftqPrefetch_flushFromBpu_s3_valid),
    .io_ftqPrefetch_flushFromBpu_s3_bits_flag(io_ftqPrefetch_flushFromBpu_s3_bits_flag),
    .io_ftqPrefetch_flushFromBpu_s3_bits_value(io_ftqPrefetch_flushFromBpu_s3_bits_value),
    .io_ftqPrefetch_backendException(io_ftqPrefetch_backendException),
    .io_softPrefetch_0_valid(io_softPrefetch_0_valid),
    .io_softPrefetch_0_bits_vaddr(io_softPrefetch_0_bits_vaddr),
    .io_softPrefetch_1_valid(io_softPrefetch_1_valid),
    .io_softPrefetch_1_bits_vaddr(io_softPrefetch_1_bits_vaddr),
    .io_softPrefetch_2_valid(io_softPrefetch_2_valid),
    .io_softPrefetch_2_bits_vaddr(io_softPrefetch_2_bits_vaddr),
    .io_stop(io_stop),
    .io_toIFU(io_toIFU),
    .io_pmp_0_req_bits_addr(io_pmp_0_req_bits_addr),
    .io_pmp_0_resp_instr(io_pmp_0_resp_instr),
    .io_pmp_0_resp_mmio(io_pmp_0_resp_mmio),
    .io_pmp_1_req_bits_addr(io_pmp_1_req_bits_addr),
    .io_pmp_1_resp_instr(io_pmp_1_resp_instr),
    .io_pmp_1_resp_mmio(io_pmp_1_resp_mmio),
    .io_pmp_2_req_bits_addr(io_pmp_2_req_bits_addr),
    .io_pmp_2_resp_instr(io_pmp_2_resp_instr),
    .io_pmp_2_resp_mmio(io_pmp_2_resp_mmio),
    .io_pmp_3_req_bits_addr(io_pmp_3_req_bits_addr),
    .io_pmp_3_resp_instr(io_pmp_3_resp_instr),
    .io_pmp_3_resp_mmio(io_pmp_3_resp_mmio),
    .io_itlb_0_req_valid(io_itlb_0_req_valid),
    .io_itlb_0_req_bits_vaddr(io_itlb_0_req_bits_vaddr),
    .io_itlb_0_resp_bits_paddr_0(io_itlb_0_resp_bits_paddr_0),
    .io_itlb_0_resp_bits_gpaddr_0(io_itlb_0_resp_bits_gpaddr_0),
    .io_itlb_0_resp_bits_pbmt_0(io_itlb_0_resp_bits_pbmt_0),
    .io_itlb_0_resp_bits_miss(io_itlb_0_resp_bits_miss),
    .io_itlb_0_resp_bits_isForVSnonLeafPTE(io_itlb_0_resp_bits_isForVSnonLeafPTE),
    .io_itlb_0_resp_bits_excp_0_gpf_instr(io_itlb_0_resp_bits_excp_0_gpf_instr),
    .io_itlb_0_resp_bits_excp_0_pf_instr(io_itlb_0_resp_bits_excp_0_pf_instr),
    .io_itlb_0_resp_bits_excp_0_af_instr(io_itlb_0_resp_bits_excp_0_af_instr),
    .io_itlb_1_req_valid(io_itlb_1_req_valid),
    .io_itlb_1_req_bits_vaddr(io_itlb_1_req_bits_vaddr),
    .io_itlb_1_resp_bits_paddr_0(io_itlb_1_resp_bits_paddr_0),
    .io_itlb_1_resp_bits_gpaddr_0(io_itlb_1_resp_bits_gpaddr_0),
    .io_itlb_1_resp_bits_pbmt_0(io_itlb_1_resp_bits_pbmt_0),
    .io_itlb_1_resp_bits_miss(io_itlb_1_resp_bits_miss),
    .io_itlb_1_resp_bits_isForVSnonLeafPTE(io_itlb_1_resp_bits_isForVSnonLeafPTE),
    .io_itlb_1_resp_bits_excp_0_gpf_instr(io_itlb_1_resp_bits_excp_0_gpf_instr),
    .io_itlb_1_resp_bits_excp_0_pf_instr(io_itlb_1_resp_bits_excp_0_pf_instr),
    .io_itlb_1_resp_bits_excp_0_af_instr(io_itlb_1_resp_bits_excp_0_af_instr),
    .io_itlbFlushPipe(io_itlbFlushPipe),
    .io_error_valid(io_error_valid),
    .io_error_bits_paddr(io_error_bits_paddr),
    .io_error_bits_report_to_beu(io_error_bits_report_to_beu),
    .io_csr_pf_enable(io_csr_pf_enable),
    .io_fencei(io_fencei),
    .io_flush(io_flush),
    .io_perfInfo_only_0_hit(io_perfInfo_only_0_hit),
    .io_perfInfo_only_0_miss(io_perfInfo_only_0_miss),
    .io_perfInfo_hit_0_hit_1(io_perfInfo_hit_0_hit_1),
    .io_perfInfo_hit_0_miss_1(io_perfInfo_hit_0_miss_1),
    .io_perfInfo_miss_0_hit_1(io_perfInfo_miss_0_hit_1),
    .io_perfInfo_miss_0_miss_1(io_perfInfo_miss_0_miss_1),
    .io_perfInfo_hit_0_except_1(io_perfInfo_hit_0_except_1),
    .io_perfInfo_miss_0_except_1(io_perfInfo_miss_0_except_1),
    .io_perfInfo_except_0(io_perfInfo_except_0),
    .io_perfInfo_bank_hit_0(io_perfInfo_bank_hit_0),
    .io_perfInfo_bank_hit_1(io_perfInfo_bank_hit_1),
    .io_perfInfo_hit(io_perfInfo_hit),
    .boreChildrenBd_bore_array(boreChildrenBd_bore_array),
    .boreChildrenBd_bore_all(boreChildrenBd_bore_all),
    .boreChildrenBd_bore_req(boreChildrenBd_bore_req),
    .boreChildrenBd_bore_ack(boreChildrenBd_bore_ack),
    .boreChildrenBd_bore_writeen(boreChildrenBd_bore_writeen),
    .boreChildrenBd_bore_be(boreChildrenBd_bore_be),
    .boreChildrenBd_bore_addr(boreChildrenBd_bore_addr),
    .boreChildrenBd_bore_indata(boreChildrenBd_bore_indata),
    .boreChildrenBd_bore_readen(boreChildrenBd_bore_readen),
    .boreChildrenBd_bore_addr_rd(boreChildrenBd_bore_addr_rd),
    .boreChildrenBd_bore_outdata(boreChildrenBd_bore_outdata),
    .boreChildrenBd_bore_1_array(boreChildrenBd_bore_1_array),
    .boreChildrenBd_bore_1_all(boreChildrenBd_bore_1_all),
    .boreChildrenBd_bore_1_req(boreChildrenBd_bore_1_req),
    .boreChildrenBd_bore_1_ack(boreChildrenBd_bore_1_ack),
    .boreChildrenBd_bore_1_writeen(boreChildrenBd_bore_1_writeen),
    .boreChildrenBd_bore_1_be(boreChildrenBd_bore_1_be),
    .boreChildrenBd_bore_1_addr(boreChildrenBd_bore_1_addr),
    .boreChildrenBd_bore_1_indata(boreChildrenBd_bore_1_indata),
    .boreChildrenBd_bore_1_readen(boreChildrenBd_bore_1_readen),
    .boreChildrenBd_bore_1_addr_rd(boreChildrenBd_bore_1_addr_rd),
    .boreChildrenBd_bore_1_outdata(boreChildrenBd_bore_1_outdata),
    .boreChildrenBd_bore_2_array(boreChildrenBd_bore_2_array),
    .boreChildrenBd_bore_2_all(boreChildrenBd_bore_2_all),
    .boreChildrenBd_bore_2_req(boreChildrenBd_bore_2_req),
    .boreChildrenBd_bore_2_ack(boreChildrenBd_bore_2_ack),
    .boreChildrenBd_bore_2_writeen(boreChildrenBd_bore_2_writeen),
    .boreChildrenBd_bore_2_be(boreChildrenBd_bore_2_be),
    .boreChildrenBd_bore_2_addr(boreChildrenBd_bore_2_addr),
    .boreChildrenBd_bore_2_indata(boreChildrenBd_bore_2_indata),
    .boreChildrenBd_bore_2_readen(boreChildrenBd_bore_2_readen),
    .boreChildrenBd_bore_2_addr_rd(boreChildrenBd_bore_2_addr_rd),
    .boreChildrenBd_bore_2_outdata(boreChildrenBd_bore_2_outdata),
    .boreChildrenBd_bore_3_array(boreChildrenBd_bore_3_array),
    .boreChildrenBd_bore_3_all(boreChildrenBd_bore_3_all),
    .boreChildrenBd_bore_3_req(boreChildrenBd_bore_3_req),
    .boreChildrenBd_bore_3_ack(boreChildrenBd_bore_3_ack),
    .boreChildrenBd_bore_3_writeen(boreChildrenBd_bore_3_writeen),
    .boreChildrenBd_bore_3_be(boreChildrenBd_bore_3_be),
    .boreChildrenBd_bore_3_addr(boreChildrenBd_bore_3_addr),
    .boreChildrenBd_bore_3_indata(boreChildrenBd_bore_3_indata),
    .boreChildrenBd_bore_3_readen(boreChildrenBd_bore_3_readen),
    .boreChildrenBd_bore_3_addr_rd(boreChildrenBd_bore_3_addr_rd),
    .boreChildrenBd_bore_3_outdata(boreChildrenBd_bore_3_outdata),
    .boreChildrenBd_bore_4_array(boreChildrenBd_bore_4_array),
    .boreChildrenBd_bore_4_all(boreChildrenBd_bore_4_all),
    .boreChildrenBd_bore_4_req(boreChildrenBd_bore_4_req),
    .boreChildrenBd_bore_4_ack(boreChildrenBd_bore_4_ack),
    .boreChildrenBd_bore_4_writeen(boreChildrenBd_bore_4_writeen),
    .boreChildrenBd_bore_4_be(boreChildrenBd_bore_4_be),
    .boreChildrenBd_bore_4_addr(boreChildrenBd_bore_4_addr),
    .boreChildrenBd_bore_4_indata(boreChildrenBd_bore_4_indata),
    .boreChildrenBd_bore_4_readen(boreChildrenBd_bore_4_readen),
    .boreChildrenBd_bore_4_addr_rd(boreChildrenBd_bore_4_addr_rd),
    .boreChildrenBd_bore_4_outdata(boreChildrenBd_bore_4_outdata)
 );


  export "DPI-C" function get_clockxxPfBDHOJ3H41;
  export "DPI-C" function set_clockxxPfBDHOJ3H41;
  export "DPI-C" function get_resetxxPfBDHOJ3H41;
  export "DPI-C" function set_resetxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_readyxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_validxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_validxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_opcodexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_opcodexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_sizexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_sizexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_addressxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_addressxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_maskxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_maskxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_a_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_a_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_readyxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_ctrlUnitOpt_in_d_readyxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_validxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_bits_opcodexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_bits_sizexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_ctrlUnitOpt_in_d_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_a_readyxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_a_readyxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_a_validxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_a_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_a_bits_addressxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_validxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_validxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_bits_opcodexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_bits_opcodexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_bits_sizexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_bits_sizexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_bits_sourcexxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function get_auto_client_out_d_bits_corruptxxPfBDHOJ3H41;
  export "DPI-C" function set_auto_client_out_d_bits_corruptxxPfBDHOJ3H41;
  export "DPI-C" function get_io_hartIdxxPfBDHOJ3H41;
  export "DPI-C" function set_io_hartIdxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_readyxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_0_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_0_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_0_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_0_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_1_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_1_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_1_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_1_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_2_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_2_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_2_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_2_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_3_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_3_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_3_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_3_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_4_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_4_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_pcMemRead_4_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_pcMemRead_4_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_readValid_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_readValid_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_readValid_1xxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_readValid_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_readValid_2xxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_readValid_2xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_readValid_3xxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_readValid_3xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_readValid_4xxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_readValid_4xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_req_bits_backendExceptionxxPfBDHOJ3H41;
  export "DPI-C" function set_io_fetch_req_bits_backendExceptionxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_doublelinexxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_vaddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_vaddr_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_dataxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_paddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_exception_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_exception_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_pmp_mmio_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_pmp_mmio_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_itlb_pbmt_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_itlb_pbmt_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_backendExceptionxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_gpaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_topdownIcacheMissxxPfBDHOJ3H41;
  export "DPI-C" function get_io_fetch_topdownItlbMissxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_readyxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_req_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_bits_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_req_bits_startAddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_bits_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_req_bits_nextlineStartxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_bits_ftqIdx_flagxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_req_bits_ftqIdx_flagxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_req_bits_ftqIdx_valuexxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_req_bits_ftqIdx_valuexxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s2_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s2_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s2_bits_flagxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s2_bits_flagxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s2_bits_valuexxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s2_bits_valuexxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s3_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s3_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s3_bits_flagxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s3_bits_flagxxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_flushFromBpu_s3_bits_valuexxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_flushFromBpu_s3_bits_valuexxPfBDHOJ3H41;
  export "DPI-C" function get_io_ftqPrefetch_backendExceptionxxPfBDHOJ3H41;
  export "DPI-C" function set_io_ftqPrefetch_backendExceptionxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_0_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_0_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_0_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_0_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_1_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_1_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_1_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_1_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_2_validxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_2_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_softPrefetch_2_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_softPrefetch_2_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_stopxxPfBDHOJ3H41;
  export "DPI-C" function set_io_stopxxPfBDHOJ3H41;
  export "DPI-C" function get_io_toIFUxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_0_req_bits_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_0_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_0_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_0_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_0_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_1_req_bits_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_1_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_1_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_1_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_1_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_2_req_bits_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_2_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_2_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_2_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_2_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_3_req_bits_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_3_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_3_resp_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_pmp_3_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function set_io_pmp_3_resp_mmioxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_req_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_req_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_paddr_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_paddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_gpaddr_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_gpaddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_pbmt_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_pbmt_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_missxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_missxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_0_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_0_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_req_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_req_bits_vaddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_paddr_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_paddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_gpaddr_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_gpaddr_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_pbmt_0xxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_pbmt_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_missxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_missxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlb_1_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
  export "DPI-C" function set_io_itlb_1_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_itlbFlushPipexxPfBDHOJ3H41;
  export "DPI-C" function get_io_error_validxxPfBDHOJ3H41;
  export "DPI-C" function get_io_error_bits_paddrxxPfBDHOJ3H41;
  export "DPI-C" function get_io_error_bits_report_to_beuxxPfBDHOJ3H41;
  export "DPI-C" function get_io_csr_pf_enablexxPfBDHOJ3H41;
  export "DPI-C" function set_io_csr_pf_enablexxPfBDHOJ3H41;
  export "DPI-C" function get_io_fenceixxPfBDHOJ3H41;
  export "DPI-C" function set_io_fenceixxPfBDHOJ3H41;
  export "DPI-C" function get_io_flushxxPfBDHOJ3H41;
  export "DPI-C" function set_io_flushxxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_only_0_hitxxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_only_0_missxxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_hit_0_hit_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_hit_0_miss_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_miss_0_hit_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_miss_0_miss_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_hit_0_except_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_miss_0_except_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_except_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_bank_hit_0xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_bank_hit_1xxPfBDHOJ3H41;
  export "DPI-C" function get_io_perfInfo_hitxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_arrayxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_arrayxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_allxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_allxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_reqxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_reqxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_ackxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_writeenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_writeenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_bexxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_bexxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_addrxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_indataxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_indataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_readenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_readenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_outdataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_arrayxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_arrayxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_allxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_allxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_reqxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_reqxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_ackxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_writeenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_writeenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_bexxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_bexxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_addrxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_indataxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_indataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_readenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_readenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_1_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_1_outdataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_arrayxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_arrayxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_allxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_allxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_reqxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_reqxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_ackxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_writeenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_writeenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_bexxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_bexxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_addrxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_indataxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_indataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_readenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_readenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_2_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_2_outdataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_arrayxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_arrayxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_allxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_allxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_reqxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_reqxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_ackxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_writeenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_writeenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_bexxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_bexxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_addrxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_indataxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_indataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_readenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_readenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_3_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_3_outdataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_arrayxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_arrayxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_allxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_allxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_reqxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_reqxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_ackxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_writeenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_writeenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_bexxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_bexxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_addrxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_addrxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_indataxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_indataxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_readenxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_readenxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function set_boreChildrenBd_bore_4_addr_rdxxPfBDHOJ3H41;
  export "DPI-C" function get_boreChildrenBd_bore_4_outdataxxPfBDHOJ3H41;
  export "DPI-C" function get_ICache__metaArray_io_read_readyxxPfBDHOJ3H41;


  function void get_clockxxPfBDHOJ3H41;
    output logic  value;
    value=clock;
  endfunction

  function void set_clockxxPfBDHOJ3H41;
    input logic  value;
    clock=value;
  endfunction

  function void get_resetxxPfBDHOJ3H41;
    output logic  value;
    value=reset;
  endfunction

  function void set_resetxxPfBDHOJ3H41;
    input logic  value;
    reset=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_readyxxPfBDHOJ3H41;
    output logic  value;
    value=auto_ctrlUnitOpt_in_a_ready;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_validxxPfBDHOJ3H41;
    output logic  value;
    value=auto_ctrlUnitOpt_in_a_valid;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_validxxPfBDHOJ3H41;
    input logic  value;
    auto_ctrlUnitOpt_in_a_valid=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_opcodexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_opcode;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_opcodexxPfBDHOJ3H41;
    input logic [3:0] value;
    auto_ctrlUnitOpt_in_a_bits_opcode=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_sizexxPfBDHOJ3H41;
    output logic [1:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_size;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_sizexxPfBDHOJ3H41;
    input logic [1:0] value;
    auto_ctrlUnitOpt_in_a_bits_size=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_sourcexxPfBDHOJ3H41;
    output logic [2:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_source;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_sourcexxPfBDHOJ3H41;
    input logic [2:0] value;
    auto_ctrlUnitOpt_in_a_bits_source=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_addressxxPfBDHOJ3H41;
    output logic [29:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_address;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_addressxxPfBDHOJ3H41;
    input logic [29:0] value;
    auto_ctrlUnitOpt_in_a_bits_address=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_maskxxPfBDHOJ3H41;
    output logic [7:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_mask;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_maskxxPfBDHOJ3H41;
    input logic [7:0] value;
    auto_ctrlUnitOpt_in_a_bits_mask=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_a_bits_dataxxPfBDHOJ3H41;
    output logic [63:0] value;
    value=auto_ctrlUnitOpt_in_a_bits_data;
  endfunction

  function void set_auto_ctrlUnitOpt_in_a_bits_dataxxPfBDHOJ3H41;
    input logic [63:0] value;
    auto_ctrlUnitOpt_in_a_bits_data=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_readyxxPfBDHOJ3H41;
    output logic  value;
    value=auto_ctrlUnitOpt_in_d_ready;
  endfunction

  function void set_auto_ctrlUnitOpt_in_d_readyxxPfBDHOJ3H41;
    input logic  value;
    auto_ctrlUnitOpt_in_d_ready=value;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_validxxPfBDHOJ3H41;
    output logic  value;
    value=auto_ctrlUnitOpt_in_d_valid;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_bits_opcodexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=auto_ctrlUnitOpt_in_d_bits_opcode;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_bits_sizexxPfBDHOJ3H41;
    output logic [1:0] value;
    value=auto_ctrlUnitOpt_in_d_bits_size;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_bits_sourcexxPfBDHOJ3H41;
    output logic [2:0] value;
    value=auto_ctrlUnitOpt_in_d_bits_source;
  endfunction

  function void get_auto_ctrlUnitOpt_in_d_bits_dataxxPfBDHOJ3H41;
    output logic [63:0] value;
    value=auto_ctrlUnitOpt_in_d_bits_data;
  endfunction

  function void get_auto_client_out_a_readyxxPfBDHOJ3H41;
    output logic  value;
    value=auto_client_out_a_ready;
  endfunction

  function void set_auto_client_out_a_readyxxPfBDHOJ3H41;
    input logic  value;
    auto_client_out_a_ready=value;
  endfunction

  function void get_auto_client_out_a_validxxPfBDHOJ3H41;
    output logic  value;
    value=auto_client_out_a_valid;
  endfunction

  function void get_auto_client_out_a_bits_sourcexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=auto_client_out_a_bits_source;
  endfunction

  function void get_auto_client_out_a_bits_addressxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=auto_client_out_a_bits_address;
  endfunction

  function void get_auto_client_out_d_validxxPfBDHOJ3H41;
    output logic  value;
    value=auto_client_out_d_valid;
  endfunction

  function void set_auto_client_out_d_validxxPfBDHOJ3H41;
    input logic  value;
    auto_client_out_d_valid=value;
  endfunction

  function void get_auto_client_out_d_bits_opcodexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=auto_client_out_d_bits_opcode;
  endfunction

  function void set_auto_client_out_d_bits_opcodexxPfBDHOJ3H41;
    input logic [3:0] value;
    auto_client_out_d_bits_opcode=value;
  endfunction

  function void get_auto_client_out_d_bits_sizexxPfBDHOJ3H41;
    output logic [2:0] value;
    value=auto_client_out_d_bits_size;
  endfunction

  function void set_auto_client_out_d_bits_sizexxPfBDHOJ3H41;
    input logic [2:0] value;
    auto_client_out_d_bits_size=value;
  endfunction

  function void get_auto_client_out_d_bits_sourcexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=auto_client_out_d_bits_source;
  endfunction

  function void set_auto_client_out_d_bits_sourcexxPfBDHOJ3H41;
    input logic [3:0] value;
    auto_client_out_d_bits_source=value;
  endfunction

  function void get_auto_client_out_d_bits_dataxxPfBDHOJ3H41;
    output logic [255:0] value;
    value=auto_client_out_d_bits_data;
  endfunction

  function void set_auto_client_out_d_bits_dataxxPfBDHOJ3H41;
    input logic [255:0] value;
    auto_client_out_d_bits_data=value;
  endfunction

  function void get_auto_client_out_d_bits_corruptxxPfBDHOJ3H41;
    output logic  value;
    value=auto_client_out_d_bits_corrupt;
  endfunction

  function void set_auto_client_out_d_bits_corruptxxPfBDHOJ3H41;
    input logic  value;
    auto_client_out_d_bits_corrupt=value;
  endfunction

  function void get_io_hartIdxxPfBDHOJ3H41;
    output logic [5:0] value;
    value=io_hartId;
  endfunction

  function void set_io_hartIdxxPfBDHOJ3H41;
    input logic [5:0] value;
    io_hartId=value;
  endfunction

  function void get_io_fetch_req_readyxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_ready;
  endfunction

  function void get_io_fetch_req_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_valid;
  endfunction

  function void set_io_fetch_req_validxxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_valid=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_0_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_0_startAddr;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_0_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_0_startAddr=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_0_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_0_nextlineStart;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_0_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_0_nextlineStart=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_1_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_1_startAddr;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_1_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_1_startAddr=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_1_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_1_nextlineStart;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_1_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_1_nextlineStart=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_2_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_2_startAddr;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_2_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_2_startAddr=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_2_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_2_nextlineStart;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_2_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_2_nextlineStart=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_3_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_3_startAddr;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_3_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_3_startAddr=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_3_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_3_nextlineStart;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_3_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_3_nextlineStart=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_4_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_4_startAddr;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_4_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_4_startAddr=value;
  endfunction

  function void get_io_fetch_req_bits_pcMemRead_4_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_req_bits_pcMemRead_4_nextlineStart;
  endfunction

  function void set_io_fetch_req_bits_pcMemRead_4_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_fetch_req_bits_pcMemRead_4_nextlineStart=value;
  endfunction

  function void get_io_fetch_req_bits_readValid_0xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_readValid_0;
  endfunction

  function void set_io_fetch_req_bits_readValid_0xxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_readValid_0=value;
  endfunction

  function void get_io_fetch_req_bits_readValid_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_readValid_1;
  endfunction

  function void set_io_fetch_req_bits_readValid_1xxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_readValid_1=value;
  endfunction

  function void get_io_fetch_req_bits_readValid_2xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_readValid_2;
  endfunction

  function void set_io_fetch_req_bits_readValid_2xxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_readValid_2=value;
  endfunction

  function void get_io_fetch_req_bits_readValid_3xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_readValid_3;
  endfunction

  function void set_io_fetch_req_bits_readValid_3xxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_readValid_3=value;
  endfunction

  function void get_io_fetch_req_bits_readValid_4xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_readValid_4;
  endfunction

  function void set_io_fetch_req_bits_readValid_4xxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_readValid_4=value;
  endfunction

  function void get_io_fetch_req_bits_backendExceptionxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_req_bits_backendException;
  endfunction

  function void set_io_fetch_req_bits_backendExceptionxxPfBDHOJ3H41;
    input logic  value;
    io_fetch_req_bits_backendException=value;
  endfunction

  function void get_io_fetch_resp_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_valid;
  endfunction

  function void get_io_fetch_resp_bits_doublelinexxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_bits_doubleline;
  endfunction

  function void get_io_fetch_resp_bits_vaddr_0xxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_resp_bits_vaddr_0;
  endfunction

  function void get_io_fetch_resp_bits_vaddr_1xxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_fetch_resp_bits_vaddr_1;
  endfunction

  function void get_io_fetch_resp_bits_dataxxPfBDHOJ3H41;
    output logic [511:0] value;
    value=io_fetch_resp_bits_data;
  endfunction

  function void get_io_fetch_resp_bits_paddr_0xxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_fetch_resp_bits_paddr_0;
  endfunction

  function void get_io_fetch_resp_bits_exception_0xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_fetch_resp_bits_exception_0;
  endfunction

  function void get_io_fetch_resp_bits_exception_1xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_fetch_resp_bits_exception_1;
  endfunction

  function void get_io_fetch_resp_bits_pmp_mmio_0xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_bits_pmp_mmio_0;
  endfunction

  function void get_io_fetch_resp_bits_pmp_mmio_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_bits_pmp_mmio_1;
  endfunction

  function void get_io_fetch_resp_bits_itlb_pbmt_0xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_fetch_resp_bits_itlb_pbmt_0;
  endfunction

  function void get_io_fetch_resp_bits_itlb_pbmt_1xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_fetch_resp_bits_itlb_pbmt_1;
  endfunction

  function void get_io_fetch_resp_bits_backendExceptionxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_bits_backendException;
  endfunction

  function void get_io_fetch_resp_bits_gpaddrxxPfBDHOJ3H41;
    output logic [55:0] value;
    value=io_fetch_resp_bits_gpaddr;
  endfunction

  function void get_io_fetch_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_resp_bits_isForVSnonLeafPTE;
  endfunction

  function void get_io_fetch_topdownIcacheMissxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_topdownIcacheMiss;
  endfunction

  function void get_io_fetch_topdownItlbMissxxPfBDHOJ3H41;
    output logic  value;
    value=io_fetch_topdownItlbMiss;
  endfunction

  function void get_io_ftqPrefetch_req_readyxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_req_ready;
  endfunction

  function void get_io_ftqPrefetch_req_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_req_valid;
  endfunction

  function void set_io_ftqPrefetch_req_validxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_req_valid=value;
  endfunction

  function void get_io_ftqPrefetch_req_bits_startAddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_ftqPrefetch_req_bits_startAddr;
  endfunction

  function void set_io_ftqPrefetch_req_bits_startAddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_ftqPrefetch_req_bits_startAddr=value;
  endfunction

  function void get_io_ftqPrefetch_req_bits_nextlineStartxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_ftqPrefetch_req_bits_nextlineStart;
  endfunction

  function void set_io_ftqPrefetch_req_bits_nextlineStartxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_ftqPrefetch_req_bits_nextlineStart=value;
  endfunction

  function void get_io_ftqPrefetch_req_bits_ftqIdx_flagxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_req_bits_ftqIdx_flag;
  endfunction

  function void set_io_ftqPrefetch_req_bits_ftqIdx_flagxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_req_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_ftqPrefetch_req_bits_ftqIdx_valuexxPfBDHOJ3H41;
    output logic [5:0] value;
    value=io_ftqPrefetch_req_bits_ftqIdx_value;
  endfunction

  function void set_io_ftqPrefetch_req_bits_ftqIdx_valuexxPfBDHOJ3H41;
    input logic [5:0] value;
    io_ftqPrefetch_req_bits_ftqIdx_value=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s2_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_flushFromBpu_s2_valid;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s2_validxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_flushFromBpu_s2_valid=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s2_bits_flagxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_flushFromBpu_s2_bits_flag;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s2_bits_flagxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_flushFromBpu_s2_bits_flag=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s2_bits_valuexxPfBDHOJ3H41;
    output logic [5:0] value;
    value=io_ftqPrefetch_flushFromBpu_s2_bits_value;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s2_bits_valuexxPfBDHOJ3H41;
    input logic [5:0] value;
    io_ftqPrefetch_flushFromBpu_s2_bits_value=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s3_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_flushFromBpu_s3_valid;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s3_validxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_flushFromBpu_s3_valid=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s3_bits_flagxxPfBDHOJ3H41;
    output logic  value;
    value=io_ftqPrefetch_flushFromBpu_s3_bits_flag;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s3_bits_flagxxPfBDHOJ3H41;
    input logic  value;
    io_ftqPrefetch_flushFromBpu_s3_bits_flag=value;
  endfunction

  function void get_io_ftqPrefetch_flushFromBpu_s3_bits_valuexxPfBDHOJ3H41;
    output logic [5:0] value;
    value=io_ftqPrefetch_flushFromBpu_s3_bits_value;
  endfunction

  function void set_io_ftqPrefetch_flushFromBpu_s3_bits_valuexxPfBDHOJ3H41;
    input logic [5:0] value;
    io_ftqPrefetch_flushFromBpu_s3_bits_value=value;
  endfunction

  function void get_io_ftqPrefetch_backendExceptionxxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_ftqPrefetch_backendException;
  endfunction

  function void set_io_ftqPrefetch_backendExceptionxxPfBDHOJ3H41;
    input logic [1:0] value;
    io_ftqPrefetch_backendException=value;
  endfunction

  function void get_io_softPrefetch_0_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_softPrefetch_0_valid;
  endfunction

  function void set_io_softPrefetch_0_validxxPfBDHOJ3H41;
    input logic  value;
    io_softPrefetch_0_valid=value;
  endfunction

  function void get_io_softPrefetch_0_bits_vaddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_softPrefetch_0_bits_vaddr;
  endfunction

  function void set_io_softPrefetch_0_bits_vaddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_softPrefetch_0_bits_vaddr=value;
  endfunction

  function void get_io_softPrefetch_1_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_softPrefetch_1_valid;
  endfunction

  function void set_io_softPrefetch_1_validxxPfBDHOJ3H41;
    input logic  value;
    io_softPrefetch_1_valid=value;
  endfunction

  function void get_io_softPrefetch_1_bits_vaddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_softPrefetch_1_bits_vaddr;
  endfunction

  function void set_io_softPrefetch_1_bits_vaddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_softPrefetch_1_bits_vaddr=value;
  endfunction

  function void get_io_softPrefetch_2_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_softPrefetch_2_valid;
  endfunction

  function void set_io_softPrefetch_2_validxxPfBDHOJ3H41;
    input logic  value;
    io_softPrefetch_2_valid=value;
  endfunction

  function void get_io_softPrefetch_2_bits_vaddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_softPrefetch_2_bits_vaddr;
  endfunction

  function void set_io_softPrefetch_2_bits_vaddrxxPfBDHOJ3H41;
    input logic [49:0] value;
    io_softPrefetch_2_bits_vaddr=value;
  endfunction

  function void get_io_stopxxPfBDHOJ3H41;
    output logic  value;
    value=io_stop;
  endfunction

  function void set_io_stopxxPfBDHOJ3H41;
    input logic  value;
    io_stop=value;
  endfunction

  function void get_io_toIFUxxPfBDHOJ3H41;
    output logic  value;
    value=io_toIFU;
  endfunction

  function void get_io_pmp_0_req_bits_addrxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_pmp_0_req_bits_addr;
  endfunction

  function void get_io_pmp_0_resp_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_0_resp_instr;
  endfunction

  function void set_io_pmp_0_resp_instrxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_0_resp_instr=value;
  endfunction

  function void get_io_pmp_0_resp_mmioxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_0_resp_mmio;
  endfunction

  function void set_io_pmp_0_resp_mmioxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_0_resp_mmio=value;
  endfunction

  function void get_io_pmp_1_req_bits_addrxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_pmp_1_req_bits_addr;
  endfunction

  function void get_io_pmp_1_resp_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_1_resp_instr;
  endfunction

  function void set_io_pmp_1_resp_instrxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_1_resp_instr=value;
  endfunction

  function void get_io_pmp_1_resp_mmioxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_1_resp_mmio;
  endfunction

  function void set_io_pmp_1_resp_mmioxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_1_resp_mmio=value;
  endfunction

  function void get_io_pmp_2_req_bits_addrxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_pmp_2_req_bits_addr;
  endfunction

  function void get_io_pmp_2_resp_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_2_resp_instr;
  endfunction

  function void set_io_pmp_2_resp_instrxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_2_resp_instr=value;
  endfunction

  function void get_io_pmp_2_resp_mmioxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_2_resp_mmio;
  endfunction

  function void set_io_pmp_2_resp_mmioxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_2_resp_mmio=value;
  endfunction

  function void get_io_pmp_3_req_bits_addrxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_pmp_3_req_bits_addr;
  endfunction

  function void get_io_pmp_3_resp_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_3_resp_instr;
  endfunction

  function void set_io_pmp_3_resp_instrxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_3_resp_instr=value;
  endfunction

  function void get_io_pmp_3_resp_mmioxxPfBDHOJ3H41;
    output logic  value;
    value=io_pmp_3_resp_mmio;
  endfunction

  function void set_io_pmp_3_resp_mmioxxPfBDHOJ3H41;
    input logic  value;
    io_pmp_3_resp_mmio=value;
  endfunction

  function void get_io_itlb_0_req_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_req_valid;
  endfunction

  function void get_io_itlb_0_req_bits_vaddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_itlb_0_req_bits_vaddr;
  endfunction

  function void get_io_itlb_0_resp_bits_paddr_0xxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_itlb_0_resp_bits_paddr_0;
  endfunction

  function void set_io_itlb_0_resp_bits_paddr_0xxPfBDHOJ3H41;
    input logic [47:0] value;
    io_itlb_0_resp_bits_paddr_0=value;
  endfunction

  function void get_io_itlb_0_resp_bits_gpaddr_0xxPfBDHOJ3H41;
    output logic [63:0] value;
    value=io_itlb_0_resp_bits_gpaddr_0;
  endfunction

  function void set_io_itlb_0_resp_bits_gpaddr_0xxPfBDHOJ3H41;
    input logic [63:0] value;
    io_itlb_0_resp_bits_gpaddr_0=value;
  endfunction

  function void get_io_itlb_0_resp_bits_pbmt_0xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_itlb_0_resp_bits_pbmt_0;
  endfunction

  function void set_io_itlb_0_resp_bits_pbmt_0xxPfBDHOJ3H41;
    input logic [1:0] value;
    io_itlb_0_resp_bits_pbmt_0=value;
  endfunction

  function void get_io_itlb_0_resp_bits_missxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_resp_bits_miss;
  endfunction

  function void set_io_itlb_0_resp_bits_missxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_0_resp_bits_miss=value;
  endfunction

  function void get_io_itlb_0_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_resp_bits_isForVSnonLeafPTE;
  endfunction

  function void set_io_itlb_0_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
    input logic  value;
    io_itlb_0_resp_bits_isForVSnonLeafPTE=value;
  endfunction

  function void get_io_itlb_0_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_resp_bits_excp_0_gpf_instr;
  endfunction

  function void set_io_itlb_0_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_0_resp_bits_excp_0_gpf_instr=value;
  endfunction

  function void get_io_itlb_0_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_resp_bits_excp_0_pf_instr;
  endfunction

  function void set_io_itlb_0_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_0_resp_bits_excp_0_pf_instr=value;
  endfunction

  function void get_io_itlb_0_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_0_resp_bits_excp_0_af_instr;
  endfunction

  function void set_io_itlb_0_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_0_resp_bits_excp_0_af_instr=value;
  endfunction

  function void get_io_itlb_1_req_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_req_valid;
  endfunction

  function void get_io_itlb_1_req_bits_vaddrxxPfBDHOJ3H41;
    output logic [49:0] value;
    value=io_itlb_1_req_bits_vaddr;
  endfunction

  function void get_io_itlb_1_resp_bits_paddr_0xxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_itlb_1_resp_bits_paddr_0;
  endfunction

  function void set_io_itlb_1_resp_bits_paddr_0xxPfBDHOJ3H41;
    input logic [47:0] value;
    io_itlb_1_resp_bits_paddr_0=value;
  endfunction

  function void get_io_itlb_1_resp_bits_gpaddr_0xxPfBDHOJ3H41;
    output logic [63:0] value;
    value=io_itlb_1_resp_bits_gpaddr_0;
  endfunction

  function void set_io_itlb_1_resp_bits_gpaddr_0xxPfBDHOJ3H41;
    input logic [63:0] value;
    io_itlb_1_resp_bits_gpaddr_0=value;
  endfunction

  function void get_io_itlb_1_resp_bits_pbmt_0xxPfBDHOJ3H41;
    output logic [1:0] value;
    value=io_itlb_1_resp_bits_pbmt_0;
  endfunction

  function void set_io_itlb_1_resp_bits_pbmt_0xxPfBDHOJ3H41;
    input logic [1:0] value;
    io_itlb_1_resp_bits_pbmt_0=value;
  endfunction

  function void get_io_itlb_1_resp_bits_missxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_resp_bits_miss;
  endfunction

  function void set_io_itlb_1_resp_bits_missxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_1_resp_bits_miss=value;
  endfunction

  function void get_io_itlb_1_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_resp_bits_isForVSnonLeafPTE;
  endfunction

  function void set_io_itlb_1_resp_bits_isForVSnonLeafPTExxPfBDHOJ3H41;
    input logic  value;
    io_itlb_1_resp_bits_isForVSnonLeafPTE=value;
  endfunction

  function void get_io_itlb_1_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_resp_bits_excp_0_gpf_instr;
  endfunction

  function void set_io_itlb_1_resp_bits_excp_0_gpf_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_1_resp_bits_excp_0_gpf_instr=value;
  endfunction

  function void get_io_itlb_1_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_resp_bits_excp_0_pf_instr;
  endfunction

  function void set_io_itlb_1_resp_bits_excp_0_pf_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_1_resp_bits_excp_0_pf_instr=value;
  endfunction

  function void get_io_itlb_1_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
    output logic  value;
    value=io_itlb_1_resp_bits_excp_0_af_instr;
  endfunction

  function void set_io_itlb_1_resp_bits_excp_0_af_instrxxPfBDHOJ3H41;
    input logic  value;
    io_itlb_1_resp_bits_excp_0_af_instr=value;
  endfunction

  function void get_io_itlbFlushPipexxPfBDHOJ3H41;
    output logic  value;
    value=io_itlbFlushPipe;
  endfunction

  function void get_io_error_validxxPfBDHOJ3H41;
    output logic  value;
    value=io_error_valid;
  endfunction

  function void get_io_error_bits_paddrxxPfBDHOJ3H41;
    output logic [47:0] value;
    value=io_error_bits_paddr;
  endfunction

  function void get_io_error_bits_report_to_beuxxPfBDHOJ3H41;
    output logic  value;
    value=io_error_bits_report_to_beu;
  endfunction

  function void get_io_csr_pf_enablexxPfBDHOJ3H41;
    output logic  value;
    value=io_csr_pf_enable;
  endfunction

  function void set_io_csr_pf_enablexxPfBDHOJ3H41;
    input logic  value;
    io_csr_pf_enable=value;
  endfunction

  function void get_io_fenceixxPfBDHOJ3H41;
    output logic  value;
    value=io_fencei;
  endfunction

  function void set_io_fenceixxPfBDHOJ3H41;
    input logic  value;
    io_fencei=value;
  endfunction

  function void get_io_flushxxPfBDHOJ3H41;
    output logic  value;
    value=io_flush;
  endfunction

  function void set_io_flushxxPfBDHOJ3H41;
    input logic  value;
    io_flush=value;
  endfunction

  function void get_io_perfInfo_only_0_hitxxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_only_0_hit;
  endfunction

  function void get_io_perfInfo_only_0_missxxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_only_0_miss;
  endfunction

  function void get_io_perfInfo_hit_0_hit_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_hit_0_hit_1;
  endfunction

  function void get_io_perfInfo_hit_0_miss_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_hit_0_miss_1;
  endfunction

  function void get_io_perfInfo_miss_0_hit_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_miss_0_hit_1;
  endfunction

  function void get_io_perfInfo_miss_0_miss_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_miss_0_miss_1;
  endfunction

  function void get_io_perfInfo_hit_0_except_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_hit_0_except_1;
  endfunction

  function void get_io_perfInfo_miss_0_except_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_miss_0_except_1;
  endfunction

  function void get_io_perfInfo_except_0xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_except_0;
  endfunction

  function void get_io_perfInfo_bank_hit_0xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_bank_hit_0;
  endfunction

  function void get_io_perfInfo_bank_hit_1xxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_bank_hit_1;
  endfunction

  function void get_io_perfInfo_hitxxPfBDHOJ3H41;
    output logic  value;
    value=io_perfInfo_hit;
  endfunction

  function void get_boreChildrenBd_bore_arrayxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_array;
  endfunction

  function void set_boreChildrenBd_bore_arrayxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_array=value;
  endfunction

  function void get_boreChildrenBd_bore_allxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_all;
  endfunction

  function void set_boreChildrenBd_bore_allxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_all=value;
  endfunction

  function void get_boreChildrenBd_bore_reqxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_req;
  endfunction

  function void set_boreChildrenBd_bore_reqxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_req=value;
  endfunction

  function void get_boreChildrenBd_bore_ackxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_ack;
  endfunction

  function void get_boreChildrenBd_bore_writeenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_writeen;
  endfunction

  function void set_boreChildrenBd_bore_writeenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_writeen=value;
  endfunction

  function void get_boreChildrenBd_bore_bexxPfBDHOJ3H41;
    output logic [3:0] value;
    value=boreChildrenBd_bore_be;
  endfunction

  function void set_boreChildrenBd_bore_bexxPfBDHOJ3H41;
    input logic [3:0] value;
    boreChildrenBd_bore_be=value;
  endfunction

  function void get_boreChildrenBd_bore_addrxxPfBDHOJ3H41;
    output logic [7:0] value;
    value=boreChildrenBd_bore_addr;
  endfunction

  function void set_boreChildrenBd_bore_addrxxPfBDHOJ3H41;
    input logic [7:0] value;
    boreChildrenBd_bore_addr=value;
  endfunction

  function void get_boreChildrenBd_bore_indataxxPfBDHOJ3H41;
    output logic [147:0] value;
    value=boreChildrenBd_bore_indata;
  endfunction

  function void set_boreChildrenBd_bore_indataxxPfBDHOJ3H41;
    input logic [147:0] value;
    boreChildrenBd_bore_indata=value;
  endfunction

  function void get_boreChildrenBd_bore_readenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_readen;
  endfunction

  function void set_boreChildrenBd_bore_readenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_readen=value;
  endfunction

  function void get_boreChildrenBd_bore_addr_rdxxPfBDHOJ3H41;
    output logic [7:0] value;
    value=boreChildrenBd_bore_addr_rd;
  endfunction

  function void set_boreChildrenBd_bore_addr_rdxxPfBDHOJ3H41;
    input logic [7:0] value;
    boreChildrenBd_bore_addr_rd=value;
  endfunction

  function void get_boreChildrenBd_bore_outdataxxPfBDHOJ3H41;
    output logic [147:0] value;
    value=boreChildrenBd_bore_outdata;
  endfunction

  function void get_boreChildrenBd_bore_1_arrayxxPfBDHOJ3H41;
    output logic [3:0] value;
    value=boreChildrenBd_bore_1_array;
  endfunction

  function void set_boreChildrenBd_bore_1_arrayxxPfBDHOJ3H41;
    input logic [3:0] value;
    boreChildrenBd_bore_1_array=value;
  endfunction

  function void get_boreChildrenBd_bore_1_allxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_all;
  endfunction

  function void set_boreChildrenBd_bore_1_allxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_1_all=value;
  endfunction

  function void get_boreChildrenBd_bore_1_reqxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_req;
  endfunction

  function void set_boreChildrenBd_bore_1_reqxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_1_req=value;
  endfunction

  function void get_boreChildrenBd_bore_1_ackxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_ack;
  endfunction

  function void get_boreChildrenBd_bore_1_writeenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_writeen;
  endfunction

  function void set_boreChildrenBd_bore_1_writeenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_1_writeen=value;
  endfunction

  function void get_boreChildrenBd_bore_1_bexxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_be;
  endfunction

  function void set_boreChildrenBd_bore_1_bexxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_1_be=value;
  endfunction

  function void get_boreChildrenBd_bore_1_addrxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_1_addr;
  endfunction

  function void set_boreChildrenBd_bore_1_addrxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_1_addr=value;
  endfunction

  function void get_boreChildrenBd_bore_1_indataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_1_indata;
  endfunction

  function void set_boreChildrenBd_bore_1_indataxxPfBDHOJ3H41;
    input logic [65:0] value;
    boreChildrenBd_bore_1_indata=value;
  endfunction

  function void get_boreChildrenBd_bore_1_readenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_1_readen;
  endfunction

  function void set_boreChildrenBd_bore_1_readenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_1_readen=value;
  endfunction

  function void get_boreChildrenBd_bore_1_addr_rdxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_1_addr_rd;
  endfunction

  function void set_boreChildrenBd_bore_1_addr_rdxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_1_addr_rd=value;
  endfunction

  function void get_boreChildrenBd_bore_1_outdataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_1_outdata;
  endfunction

  function void get_boreChildrenBd_bore_2_arrayxxPfBDHOJ3H41;
    output logic [4:0] value;
    value=boreChildrenBd_bore_2_array;
  endfunction

  function void set_boreChildrenBd_bore_2_arrayxxPfBDHOJ3H41;
    input logic [4:0] value;
    boreChildrenBd_bore_2_array=value;
  endfunction

  function void get_boreChildrenBd_bore_2_allxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_all;
  endfunction

  function void set_boreChildrenBd_bore_2_allxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_2_all=value;
  endfunction

  function void get_boreChildrenBd_bore_2_reqxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_req;
  endfunction

  function void set_boreChildrenBd_bore_2_reqxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_2_req=value;
  endfunction

  function void get_boreChildrenBd_bore_2_ackxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_ack;
  endfunction

  function void get_boreChildrenBd_bore_2_writeenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_writeen;
  endfunction

  function void set_boreChildrenBd_bore_2_writeenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_2_writeen=value;
  endfunction

  function void get_boreChildrenBd_bore_2_bexxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_be;
  endfunction

  function void set_boreChildrenBd_bore_2_bexxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_2_be=value;
  endfunction

  function void get_boreChildrenBd_bore_2_addrxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_2_addr;
  endfunction

  function void set_boreChildrenBd_bore_2_addrxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_2_addr=value;
  endfunction

  function void get_boreChildrenBd_bore_2_indataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_2_indata;
  endfunction

  function void set_boreChildrenBd_bore_2_indataxxPfBDHOJ3H41;
    input logic [65:0] value;
    boreChildrenBd_bore_2_indata=value;
  endfunction

  function void get_boreChildrenBd_bore_2_readenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_2_readen;
  endfunction

  function void set_boreChildrenBd_bore_2_readenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_2_readen=value;
  endfunction

  function void get_boreChildrenBd_bore_2_addr_rdxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_2_addr_rd;
  endfunction

  function void set_boreChildrenBd_bore_2_addr_rdxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_2_addr_rd=value;
  endfunction

  function void get_boreChildrenBd_bore_2_outdataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_2_outdata;
  endfunction

  function void get_boreChildrenBd_bore_3_arrayxxPfBDHOJ3H41;
    output logic [4:0] value;
    value=boreChildrenBd_bore_3_array;
  endfunction

  function void set_boreChildrenBd_bore_3_arrayxxPfBDHOJ3H41;
    input logic [4:0] value;
    boreChildrenBd_bore_3_array=value;
  endfunction

  function void get_boreChildrenBd_bore_3_allxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_all;
  endfunction

  function void set_boreChildrenBd_bore_3_allxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_3_all=value;
  endfunction

  function void get_boreChildrenBd_bore_3_reqxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_req;
  endfunction

  function void set_boreChildrenBd_bore_3_reqxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_3_req=value;
  endfunction

  function void get_boreChildrenBd_bore_3_ackxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_ack;
  endfunction

  function void get_boreChildrenBd_bore_3_writeenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_writeen;
  endfunction

  function void set_boreChildrenBd_bore_3_writeenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_3_writeen=value;
  endfunction

  function void get_boreChildrenBd_bore_3_bexxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_be;
  endfunction

  function void set_boreChildrenBd_bore_3_bexxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_3_be=value;
  endfunction

  function void get_boreChildrenBd_bore_3_addrxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_3_addr;
  endfunction

  function void set_boreChildrenBd_bore_3_addrxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_3_addr=value;
  endfunction

  function void get_boreChildrenBd_bore_3_indataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_3_indata;
  endfunction

  function void set_boreChildrenBd_bore_3_indataxxPfBDHOJ3H41;
    input logic [65:0] value;
    boreChildrenBd_bore_3_indata=value;
  endfunction

  function void get_boreChildrenBd_bore_3_readenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_3_readen;
  endfunction

  function void set_boreChildrenBd_bore_3_readenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_3_readen=value;
  endfunction

  function void get_boreChildrenBd_bore_3_addr_rdxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_3_addr_rd;
  endfunction

  function void set_boreChildrenBd_bore_3_addr_rdxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_3_addr_rd=value;
  endfunction

  function void get_boreChildrenBd_bore_3_outdataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_3_outdata;
  endfunction

  function void get_boreChildrenBd_bore_4_arrayxxPfBDHOJ3H41;
    output logic [5:0] value;
    value=boreChildrenBd_bore_4_array;
  endfunction

  function void set_boreChildrenBd_bore_4_arrayxxPfBDHOJ3H41;
    input logic [5:0] value;
    boreChildrenBd_bore_4_array=value;
  endfunction

  function void get_boreChildrenBd_bore_4_allxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_all;
  endfunction

  function void set_boreChildrenBd_bore_4_allxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_4_all=value;
  endfunction

  function void get_boreChildrenBd_bore_4_reqxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_req;
  endfunction

  function void set_boreChildrenBd_bore_4_reqxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_4_req=value;
  endfunction

  function void get_boreChildrenBd_bore_4_ackxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_ack;
  endfunction

  function void get_boreChildrenBd_bore_4_writeenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_writeen;
  endfunction

  function void set_boreChildrenBd_bore_4_writeenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_4_writeen=value;
  endfunction

  function void get_boreChildrenBd_bore_4_bexxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_be;
  endfunction

  function void set_boreChildrenBd_bore_4_bexxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_4_be=value;
  endfunction

  function void get_boreChildrenBd_bore_4_addrxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_4_addr;
  endfunction

  function void set_boreChildrenBd_bore_4_addrxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_4_addr=value;
  endfunction

  function void get_boreChildrenBd_bore_4_indataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_4_indata;
  endfunction

  function void set_boreChildrenBd_bore_4_indataxxPfBDHOJ3H41;
    input logic [65:0] value;
    boreChildrenBd_bore_4_indata=value;
  endfunction

  function void get_boreChildrenBd_bore_4_readenxxPfBDHOJ3H41;
    output logic  value;
    value=boreChildrenBd_bore_4_readen;
  endfunction

  function void set_boreChildrenBd_bore_4_readenxxPfBDHOJ3H41;
    input logic  value;
    boreChildrenBd_bore_4_readen=value;
  endfunction

  function void get_boreChildrenBd_bore_4_addr_rdxxPfBDHOJ3H41;
    output logic [8:0] value;
    value=boreChildrenBd_bore_4_addr_rd;
  endfunction

  function void set_boreChildrenBd_bore_4_addr_rdxxPfBDHOJ3H41;
    input logic [8:0] value;
    boreChildrenBd_bore_4_addr_rd=value;
  endfunction

  function void get_boreChildrenBd_bore_4_outdataxxPfBDHOJ3H41;
    output logic [65:0] value;
    value=boreChildrenBd_bore_4_outdata;
  endfunction

  function void get_ICache__metaArray_io_read_readyxxPfBDHOJ3H41;
    output logic  value;
    value=ICache._metaArray_io_read_ready;
  endfunction



  initial begin
    $dumpfile("ICache.fst");
    $dumpvars(0, ICache_top);
  end

  export "DPI-C" function finish_PfBDHOJ3H41;
  function void finish_PfBDHOJ3H41;
    $finish;
  endfunction


endmodule
