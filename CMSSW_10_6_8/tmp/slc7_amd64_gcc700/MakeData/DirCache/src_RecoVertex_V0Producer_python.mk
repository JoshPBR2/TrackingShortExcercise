ifeq ($(strip $(PyRecoVertexV0Producer)),)
PyRecoVertexV0Producer := self/src/RecoVertex/V0Producer/python
src_RecoVertex_V0Producer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoVertex/V0Producer/python)
PyRecoVertexV0Producer_files := $(patsubst src/RecoVertex/V0Producer/python/%,%,$(wildcard $(foreach dir,src/RecoVertex/V0Producer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoVertexV0Producer_LOC_USE := self  
PyRecoVertexV0Producer_PACKAGE := self/src/RecoVertex/V0Producer/python
ALL_PRODS += PyRecoVertexV0Producer
PyRecoVertexV0Producer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoVertexV0Producer,src/RecoVertex/V0Producer/python,src_RecoVertex_V0Producer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoVertexV0Producer,src/RecoVertex/V0Producer/python))
endif
ALL_COMMONRULES += src_RecoVertex_V0Producer_python
src_RecoVertex_V0Producer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_V0Producer_python,src/RecoVertex/V0Producer/python,PYTHON))
