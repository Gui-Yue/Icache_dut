module ICache_top;

  wire  clock;
  wire  reset;
  wire  auto_ctrlUnitOpt_in_a_ready;
  wire  auto_ctrlUnitOpt_in_a_valid;
  wire [3:0] auto_ctrlUnitOpt_in_a_bits_opcode;
  wire [1:0] auto_ctrlUnitOpt_in_a_bits_size;
  wire [2:0] auto_ctrlUnitOpt_in_a_bits_source;
  wire [29:0] auto_ctrlUnitOpt_in_a_bits_address;
  wire [7:0] auto_ctrlUnitOpt_in_a_bits_mask;
  wire [63:0] auto_ctrlUnitOpt_in_a_bits_data;
  wire  auto_ctrlUnitOpt_in_d_ready;
  wire  auto_ctrlUnitOpt_in_d_valid;
  wire [3:0] auto_ctrlUnitOpt_in_d_bits_opcode;
  wire [1:0] auto_ctrlUnitOpt_in_d_bits_size;
  wire [2:0] auto_ctrlUnitOpt_in_d_bits_source;
  wire [63:0] auto_ctrlUnitOpt_in_d_bits_data;
  wire  auto_client_out_a_ready;
  wire  auto_client_out_a_valid;
  wire [3:0] auto_client_out_a_bits_source;
  wire [47:0] auto_client_out_a_bits_address;
  wire  auto_client_out_d_valid;
  wire [3:0] auto_client_out_d_bits_opcode;
  wire [2:0] auto_client_out_d_bits_size;
  wire [3:0] auto_client_out_d_bits_source;
  wire [255:0] auto_client_out_d_bits_data;
  wire  auto_client_out_d_bits_corrupt;
  wire [5:0] io_hartId;
  wire  io_fetch_req_ready;
  wire  io_fetch_req_valid;
  wire [49:0] io_fetch_req_bits_pcMemRead_0_startAddr;
  wire [49:0] io_fetch_req_bits_pcMemRead_0_nextlineStart;
  wire [49:0] io_fetch_req_bits_pcMemRead_1_startAddr;
  wire [49:0] io_fetch_req_bits_pcMemRead_1_nextlineStart;
  wire [49:0] io_fetch_req_bits_pcMemRead_2_startAddr;
  wire [49:0] io_fetch_req_bits_pcMemRead_2_nextlineStart;
  wire [49:0] io_fetch_req_bits_pcMemRead_3_startAddr;
  wire [49:0] io_fetch_req_bits_pcMemRead_3_nextlineStart;
  wire [49:0] io_fetch_req_bits_pcMemRead_4_startAddr;
  wire [49:0] io_fetch_req_bits_pcMemRead_4_nextlineStart;
  wire  io_fetch_req_bits_readValid_0;
  wire  io_fetch_req_bits_readValid_1;
  wire  io_fetch_req_bits_readValid_2;
  wire  io_fetch_req_bits_readValid_3;
  wire  io_fetch_req_bits_readValid_4;
  wire  io_fetch_req_bits_backendException;
  wire  io_fetch_resp_valid;
  wire  io_fetch_resp_bits_doubleline;
  wire [49:0] io_fetch_resp_bits_vaddr_0;
  wire [49:0] io_fetch_resp_bits_vaddr_1;
  wire [511:0] io_fetch_resp_bits_data;
  wire [47:0] io_fetch_resp_bits_paddr_0;
  wire [1:0] io_fetch_resp_bits_exception_0;
  wire [1:0] io_fetch_resp_bits_exception_1;
  wire  io_fetch_resp_bits_pmp_mmio_0;
  wire  io_fetch_resp_bits_pmp_mmio_1;
  wire [1:0] io_fetch_resp_bits_itlb_pbmt_0;
  wire [1:0] io_fetch_resp_bits_itlb_pbmt_1;
  wire  io_fetch_resp_bits_backendException;
  wire [55:0] io_fetch_resp_bits_gpaddr;
  wire  io_fetch_resp_bits_isForVSnonLeafPTE;
  wire  io_fetch_topdownIcacheMiss;
  wire  io_fetch_topdownItlbMiss;
  wire  io_ftqPrefetch_req_ready;
  wire  io_ftqPrefetch_req_valid;
  wire [49:0] io_ftqPrefetch_req_bits_startAddr;
  wire [49:0] io_ftqPrefetch_req_bits_nextlineStart;
  wire  io_ftqPrefetch_req_bits_ftqIdx_flag;
  wire [5:0] io_ftqPrefetch_req_bits_ftqIdx_value;
  wire  io_ftqPrefetch_flushFromBpu_s2_valid;
  wire  io_ftqPrefetch_flushFromBpu_s2_bits_flag;
  wire [5:0] io_ftqPrefetch_flushFromBpu_s2_bits_value;
  wire  io_ftqPrefetch_flushFromBpu_s3_valid;
  wire  io_ftqPrefetch_flushFromBpu_s3_bits_flag;
  wire [5:0] io_ftqPrefetch_flushFromBpu_s3_bits_value;
  wire [1:0] io_ftqPrefetch_backendException;
  wire  io_softPrefetch_0_valid;
  wire [49:0] io_softPrefetch_0_bits_vaddr;
  wire  io_softPrefetch_1_valid;
  wire [49:0] io_softPrefetch_1_bits_vaddr;
  wire  io_softPrefetch_2_valid;
  wire [49:0] io_softPrefetch_2_bits_vaddr;
  wire  io_stop;
  wire  io_toIFU;
  wire [47:0] io_pmp_0_req_bits_addr;
  wire  io_pmp_0_resp_instr;
  wire  io_pmp_0_resp_mmio;
  wire [47:0] io_pmp_1_req_bits_addr;
  wire  io_pmp_1_resp_instr;
  wire  io_pmp_1_resp_mmio;
  wire [47:0] io_pmp_2_req_bits_addr;
  wire  io_pmp_2_resp_instr;
  wire  io_pmp_2_resp_mmio;
  wire [47:0] io_pmp_3_req_bits_addr;
  wire  io_pmp_3_resp_instr;
  wire  io_pmp_3_resp_mmio;
  wire  io_itlb_0_req_valid;
  wire [49:0] io_itlb_0_req_bits_vaddr;
  wire [47:0] io_itlb_0_resp_bits_paddr_0;
  wire [63:0] io_itlb_0_resp_bits_gpaddr_0;
  wire [1:0] io_itlb_0_resp_bits_pbmt_0;
  wire  io_itlb_0_resp_bits_miss;
  wire  io_itlb_0_resp_bits_isForVSnonLeafPTE;
  wire  io_itlb_0_resp_bits_excp_0_gpf_instr;
  wire  io_itlb_0_resp_bits_excp_0_pf_instr;
  wire  io_itlb_0_resp_bits_excp_0_af_instr;
  wire  io_itlb_1_req_valid;
  wire [49:0] io_itlb_1_req_bits_vaddr;
  wire [47:0] io_itlb_1_resp_bits_paddr_0;
  wire [63:0] io_itlb_1_resp_bits_gpaddr_0;
  wire [1:0] io_itlb_1_resp_bits_pbmt_0;
  wire  io_itlb_1_resp_bits_miss;
  wire  io_itlb_1_resp_bits_isForVSnonLeafPTE;
  wire  io_itlb_1_resp_bits_excp_0_gpf_instr;
  wire  io_itlb_1_resp_bits_excp_0_pf_instr;
  wire  io_itlb_1_resp_bits_excp_0_af_instr;
  wire  io_itlbFlushPipe;
  wire  io_error_valid;
  wire [47:0] io_error_bits_paddr;
  wire  io_error_bits_report_to_beu;
  wire  io_csr_pf_enable;
  wire  io_fencei;
  wire  io_flush;
  wire  io_perfInfo_only_0_hit;
  wire  io_perfInfo_only_0_miss;
  wire  io_perfInfo_hit_0_hit_1;
  wire  io_perfInfo_hit_0_miss_1;
  wire  io_perfInfo_miss_0_hit_1;
  wire  io_perfInfo_miss_0_miss_1;
  wire  io_perfInfo_hit_0_except_1;
  wire  io_perfInfo_miss_0_except_1;
  wire  io_perfInfo_except_0;
  wire  io_perfInfo_bank_hit_0;
  wire  io_perfInfo_bank_hit_1;
  wire  io_perfInfo_hit;
  wire  boreChildrenBd_bore_array;
  wire  boreChildrenBd_bore_all;
  wire  boreChildrenBd_bore_req;
  wire  boreChildrenBd_bore_ack;
  wire  boreChildrenBd_bore_writeen;
  wire [3:0] boreChildrenBd_bore_be;
  wire [7:0] boreChildrenBd_bore_addr;
  wire [147:0] boreChildrenBd_bore_indata;
  wire  boreChildrenBd_bore_readen;
  wire [7:0] boreChildrenBd_bore_addr_rd;
  wire [147:0] boreChildrenBd_bore_outdata;
  wire [3:0] boreChildrenBd_bore_1_array;
  wire  boreChildrenBd_bore_1_all;
  wire  boreChildrenBd_bore_1_req;
  wire  boreChildrenBd_bore_1_ack;
  wire  boreChildrenBd_bore_1_writeen;
  wire  boreChildrenBd_bore_1_be;
  wire [8:0] boreChildrenBd_bore_1_addr;
  wire [65:0] boreChildrenBd_bore_1_indata;
  wire  boreChildrenBd_bore_1_readen;
  wire [8:0] boreChildrenBd_bore_1_addr_rd;
  wire [65:0] boreChildrenBd_bore_1_outdata;
  wire [4:0] boreChildrenBd_bore_2_array;
  wire  boreChildrenBd_bore_2_all;
  wire  boreChildrenBd_bore_2_req;
  wire  boreChildrenBd_bore_2_ack;
  wire  boreChildrenBd_bore_2_writeen;
  wire  boreChildrenBd_bore_2_be;
  wire [8:0] boreChildrenBd_bore_2_addr;
  wire [65:0] boreChildrenBd_bore_2_indata;
  wire  boreChildrenBd_bore_2_readen;
  wire [8:0] boreChildrenBd_bore_2_addr_rd;
  wire [65:0] boreChildrenBd_bore_2_outdata;
  wire [4:0] boreChildrenBd_bore_3_array;
  wire  boreChildrenBd_bore_3_all;
  wire  boreChildrenBd_bore_3_req;
  wire  boreChildrenBd_bore_3_ack;
  wire  boreChildrenBd_bore_3_writeen;
  wire  boreChildrenBd_bore_3_be;
  wire [8:0] boreChildrenBd_bore_3_addr;
  wire [65:0] boreChildrenBd_bore_3_indata;
  wire  boreChildrenBd_bore_3_readen;
  wire [8:0] boreChildrenBd_bore_3_addr_rd;
  wire [65:0] boreChildrenBd_bore_3_outdata;
  wire [5:0] boreChildrenBd_bore_4_array;
  wire  boreChildrenBd_bore_4_all;
  wire  boreChildrenBd_bore_4_req;
  wire  boreChildrenBd_bore_4_ack;
  wire  boreChildrenBd_bore_4_writeen;
  wire  boreChildrenBd_bore_4_be;
  wire [8:0] boreChildrenBd_bore_4_addr;
  wire [65:0] boreChildrenBd_bore_4_indata;
  wire  boreChildrenBd_bore_4_readen;
  wire [8:0] boreChildrenBd_bore_4_addr_rd;
  wire [65:0] boreChildrenBd_bore_4_outdata;


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


endmodule
