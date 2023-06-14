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
ifeq ($(strip $(MyDirectoryPrintOutTracksAuto)),)
MyDirectoryPrintOutTracksAuto := self/src/MyDirectory/PrintOutTracks/plugins
PLUGINS:=yes
MyDirectoryPrintOutTracksAuto_files := $(patsubst src/MyDirectory/PrintOutTracks/plugins/%,%,$(wildcard $(foreach dir,src/MyDirectory/PrintOutTracks/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
MyDirectoryPrintOutTracksAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/MyDirectory/PrintOutTracks/plugins/BuildFile
MyDirectoryPrintOutTracksAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/TrackReco
MyDirectoryPrintOutTracksAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,MyDirectoryPrintOutTracksAuto,MyDirectoryPrintOutTracksAuto,$(SCRAMSTORENAME_LIB),src/MyDirectory/PrintOutTracks/plugins))
MyDirectoryPrintOutTracksAuto_PACKAGE := self/src/MyDirectory/PrintOutTracks/plugins
ALL_PRODS += MyDirectoryPrintOutTracksAuto
MyDirectory/PrintOutTracks_forbigobj+=MyDirectoryPrintOutTracksAuto
MyDirectoryPrintOutTracksAuto_INIT_FUNC        += $$(eval $$(call Library,MyDirectoryPrintOutTracksAuto,src/MyDirectory/PrintOutTracks/plugins,src_MyDirectory_PrintOutTracks_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
MyDirectoryPrintOutTracksAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,MyDirectoryPrintOutTracksAuto,src/MyDirectory/PrintOutTracks/plugins))
endif
ALL_COMMONRULES += src_MyDirectory_PrintOutTracks_plugins
src_MyDirectory_PrintOutTracks_plugins_parent := MyDirectory/PrintOutTracks
src_MyDirectory_PrintOutTracks_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MyDirectory_PrintOutTracks_plugins,src/MyDirectory/PrintOutTracks/plugins,PLUGINS))
