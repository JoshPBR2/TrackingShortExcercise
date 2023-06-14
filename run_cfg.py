import FWCore.ParameterSet.Config as cms

process = cms.Process("RUN")

process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring("/store/data/Run2018D/SingleMuon/AOD/12Nov2019_UL2018-v8/270001/1F848EE6-F5A5-3440-AAA8-0EFE540734A0.root"))
process.maxEvents = cms.untracked.PSet(input = cms.untracked.int32(5))

process.MessageLogger = cms.Service("MessageLogger",
    destinations = cms.untracked.vstring("cout"),
    cout = cms.untracked.PSet(threshold = cms.untracked.string("ERROR")))

process.PrintOutTracks = cms.EDAnalyzer("PrintOutTracks")
process.PrintOutTracks.tracks = cms.untracked.InputTag("generalTracks")

process.path = cms.Path(process.PrintOutTracks)
