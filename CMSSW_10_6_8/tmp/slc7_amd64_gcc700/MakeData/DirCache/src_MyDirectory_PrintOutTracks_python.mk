ifeq ($(strip $(PyMyDirectoryPrintOutTracks)),)
PyMyDirectoryPrintOutTracks := self/src/MyDirectory/PrintOutTracks/python
src_MyDirectory_PrintOutTracks_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/MyDirectory/PrintOutTracks/python)
PyMyDirectoryPrintOutTracks_files := $(patsubst src/MyDirectory/PrintOutTracks/python/%,%,$(wildcard $(foreach dir,src/MyDirectory/PrintOutTracks/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyMyDirectoryPrintOutTracks_LOC_USE := self  
PyMyDirectoryPrintOutTracks_PACKAGE := self/src/MyDirectory/PrintOutTracks/python
ALL_PRODS += PyMyDirectoryPrintOutTracks
PyMyDirectoryPrintOutTracks_INIT_FUNC        += $$(eval $$(call PythonProduct,PyMyDirectoryPrintOutTracks,src/MyDirectory/PrintOutTracks/python,src_MyDirectory_PrintOutTracks_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyMyDirectoryPrintOutTracks,src/MyDirectory/PrintOutTracks/python))
endif
ALL_COMMONRULES += src_MyDirectory_PrintOutTracks_python
src_MyDirectory_PrintOutTracks_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MyDirectory_PrintOutTracks_python,src/MyDirectory/PrintOutTracks/python,PYTHON))
