ALL_SUBSYSTEMS+=RecoVertex
subdirs_src_RecoVertex = src_RecoVertex_V0Producer
ALL_PACKAGES += RecoVertex/V0Producer
subdirs_src_RecoVertex_V0Producer := src_RecoVertex_V0Producer_python src_RecoVertex_V0Producer_src src_RecoVertex_V0Producer_test
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
ifeq ($(strip $(RecoVertexV0Analyzer)),)
RecoVertexV0Analyzer := self/src/RecoVertex/V0Producer/test
RecoVertexV0Analyzer_files := $(patsubst src/RecoVertex/V0Producer/test/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoVertex/V0Producer/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoVertex/V0Producer/test/$(file). Please fix src/RecoVertex/V0Producer/test/BuildFile.))))
RecoVertexV0Analyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoVertex/V0Producer/test/BuildFile
RecoVertexV0Analyzer_LOC_USE := self  MagneticField/Engine MagneticField/Records FWCore/Framework FWCore/ParameterSet DataFormats/TrackReco DataFormats/VertexReco DataFormats/Candidate DataFormats/RecoCandidate SimDataFormats/Track SimDataFormats/Vertex root TrackingTools/TrajectoryState TrackingTools/PatternTools Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/TransientTrack FWCore/Utilities CommonTools/UtilAlgos FWCore/ServiceRegistry
RecoVertexV0Analyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoVertexV0Analyzer,RecoVertexV0Analyzer,$(SCRAMSTORENAME_LIB),src/RecoVertex/V0Producer/test))
RecoVertexV0Analyzer_PACKAGE := self/src/RecoVertex/V0Producer/test
ALL_PRODS += RecoVertexV0Analyzer
RecoVertexV0Analyzer_INIT_FUNC        += $$(eval $$(call Library,RecoVertexV0Analyzer,src/RecoVertex/V0Producer/test,src_RecoVertex_V0Producer_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
RecoVertexV0Analyzer_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,RecoVertexV0Analyzer,src/RecoVertex/V0Producer/test))
endif
ALL_COMMONRULES += src_RecoVertex_V0Producer_test
src_RecoVertex_V0Producer_test_parent := RecoVertex/V0Producer
src_RecoVertex_V0Producer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_V0Producer_test,src/RecoVertex/V0Producer/test,TEST))
