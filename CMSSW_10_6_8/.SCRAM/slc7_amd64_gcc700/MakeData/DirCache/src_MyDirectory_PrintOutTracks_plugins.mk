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
