ifeq ($(strip $(RecoVertex/V0Producer)),)
ALL_COMMONRULES += src_RecoVertex_V0Producer_src
src_RecoVertex_V0Producer_src_parent := RecoVertex/V0Producer
src_RecoVertex_V0Producer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoVertex_V0Producer_src,src/RecoVertex/V0Producer/src,LIBRARY))
RecoVertexV0Producer := self/RecoVertex/V0Producer
RecoVertex/V0Producer := RecoVertexV0Producer
RecoVertexV0Producer_files := $(patsubst src/RecoVertex/V0Producer/src/%,%,$(wildcard $(foreach dir,src/RecoVertex/V0Producer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoVertexV0Producer_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoVertex/V0Producer/BuildFile
RecoVertexV0Producer_LOC_USE := self  root DataFormats/BeamSpot DataFormats/Candidate DataFormats/Common DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/VertexReco Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger MagneticField/Records MagneticField/VolumeBasedEngine CommonTools/CandUtils RecoVertex/AdaptiveVertexFit RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives TrackingTools/TransientTrack TrackingTools/IPTools
RecoVertexV0Producer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoVertexV0Producer,RecoVertexV0Producer,$(SCRAMSTORENAME_LIB),src/RecoVertex/V0Producer/src))
RecoVertexV0Producer_PACKAGE := self/src/RecoVertex/V0Producer/src
ALL_PRODS += RecoVertexV0Producer
RecoVertexV0Producer_CLASS := LIBRARY
RecoVertex/V0Producer_forbigobj+=RecoVertexV0Producer
RecoVertexV0Producer_INIT_FUNC        += $$(eval $$(call Library,RecoVertexV0Producer,src/RecoVertex/V0Producer/src,src_RecoVertex_V0Producer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
