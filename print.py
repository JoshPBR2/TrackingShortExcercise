import DataFormats.FWLiteas fwlite
events = fwlite.Events("file:/store/data/Run2018D/SingleMuon/AOD/12Nov2019_UL2018-v8/270001/1F848EE6-F5A5-3440-AAA8-0EFE540734A0.root")
tracks = fwlite.Handle("std::vector<reco::Tracks>")

for i, event in enumerate(events):
    if i >= 5: break        # only first 5 events
    print "Event" , i
    event.getByLabel("generalTracks", tracks)
    for j, track in enumerate(tracks.product()):
        print "     Track", j,
        print "\t charge/pT: %.3f" %(track.charge()/track.pt()),
        print "\t phi: %.3f" %track.phi(),
        print "\t eta: %.3f" %track.eta(),
        print "\t dxy: %.4f" %track.dxy(),
        print "\t dz: %.4f" %track.dz()

