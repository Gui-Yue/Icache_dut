#Makefile for ICache

export SIMULATOR = verilator
export TRACE := fst
export PROJECT := ICache
export TARGET := UT_ICache
export VERBOSE := OFF
export EXAMPLE := OFF
export TLANG := python
export SIMULATOR_FLAGS := 
export CFLAGS := 
export COVERAGE := ON
export CHECKPOINTS := OFF
export VPI := OFF
export RW_TYPE := DPI
export NPROC := `nproc`

all: release 

compile:
	mkdir -p build
	cp pli.tab build/pli.tab
	cmake . -Bbuild -DSIMULATOR=$(SIMULATOR) -DTRACE=$(TRACE) -DPROJECT=$(PROJECT) -DCMAKE_BUILD_PARALLEL=$(NPROC) -DRW_TYPE=$(RW_TYPE)
	cmake --build build --config release --parallel $(NPROC)

ifeq ($(RW_TYPE), MEM_DIRECT)
ifeq ($(SIMULATOR), verilator)
# file exsit check with Makefile
ifeq ($(wildcard build/DPIICache/VICache___024root.h),)
	@rm -rf mem_direct
	@/usr/local/bin/picker export build/DPIICache/VICache___024root.h \
		--source_dir /usr/local/share/picker/template/mem_direct --target_dir ./mem_direct \
		--source_module_name ICache
endif
	@cd mem_direct && make -j$(NPROC) TOP_NAME=ICache
	@./mem_direct/export.bin > mem_direct/ICache_offset.yaml
	@rm -rf mem_direct_tmp
endif
endif

release: compile
	@cp -r build/${TARGET} .
	@cp dut_base.hpp ${TARGET}/dut_base.hpp
	@cp mem_direct/ICache_offset.yaml ${TARGET}/ICache_offset.yaml 2>/dev/null|| true
	@make -f mk/${TLANG}.mk

ifeq ($(VERBOSE), OFF) # if VERBOSE is OFF
	@rm -rf build cmake cpp mk python java scala golang lua CMakeLists.txt dut_base.* 2>/dev/null|| true
	@rm -rf ${TARGET}.cpp filelist.f *.fst 2>/dev/null|| true
	@rm -rf mem_direct
	@mv ${TARGET}/*.v ${TARGET}/*.sv . 2>/dev/null|| true
	@cd ${TARGET} && make purge
ifeq ($(COVERAGE), OFF)
	@rm Makefile
	@rm *.v *.sv
endif
endif

coverage:
ifeq ($(COVERAGE), ON)
ifeq ($(SIMULATOR), verilator)
	@rm -rf coverage/
	@verilator_coverage -write-info coverage.info ./V${PROJECT}_coverage.dat
	@genhtml coverage.info --output-directory coverage
else
# TODO: add vcs?
	@echo $(SIMULATOR) TBD
endif
else
	@echo coverage is not on
endif

clean: 