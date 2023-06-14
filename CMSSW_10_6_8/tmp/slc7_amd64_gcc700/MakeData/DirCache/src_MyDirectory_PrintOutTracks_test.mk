ifeq ($(strip $(testMyDirectoryPrintOutTracksTP)),)
testMyDirectoryPrintOutTracksTP := self/src/MyDirectory/PrintOutTracks/test
testMyDirectoryPrintOutTracksTP_files := $(patsubst src/MyDirectory/PrintOutTracks/test/%,%,$(foreach file,test_catch2_*.cc,$(eval xfile:=$(wildcard src/MyDirectory/PrintOutTracks/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/MyDirectory/PrintOutTracks/test/$(file). Please fix src/MyDirectory/PrintOutTracks/test/BuildFile.))))
testMyDirectoryPrintOutTracksTP_TEST_RUNNER_CMD :=  testMyDirectoryPrintOutTracksTP 
testMyDirectoryPrintOutTracksTP_BuildFile    := $(WORKINGDIR)/cache/bf/src/MyDirectory/PrintOutTracks/test/BuildFile
testMyDirectoryPrintOutTracksTP_LOC_USE := self  FWCore/TestProcessor catch2
testMyDirectoryPrintOutTracksTP_PACKAGE := self/src/MyDirectory/PrintOutTracks/test
ALL_PRODS += testMyDirectoryPrintOutTracksTP
testMyDirectoryPrintOutTracksTP_INIT_FUNC        += $$(eval $$(call Binary,testMyDirectoryPrintOutTracksTP,src/MyDirectory/PrintOutTracks/test,src_MyDirectory_PrintOutTracks_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
testMyDirectoryPrintOutTracksTP_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,testMyDirectoryPrintOutTracksTP,src/MyDirectory/PrintOutTracks/test))
endif
ALL_COMMONRULES += src_MyDirectory_PrintOutTracks_test
src_MyDirectory_PrintOutTracks_test_parent := MyDirectory/PrintOutTracks
src_MyDirectory_PrintOutTracks_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MyDirectory_PrintOutTracks_test,src/MyDirectory/PrintOutTracks/test,TEST))
