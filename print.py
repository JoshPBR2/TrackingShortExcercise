import DataFormats.FWLiteas fwlite
events = fwlite.Events("file:/store/data/Run2018D/SingleMuon/AOD/12Nov2019_UL2018-v8/270001/1F848EE6-F5A5-3440-AAA8-0EFE540734A0.root")
tracks = fwlite.Handle("std::vector<reco::Tracks>")
MVAs = fwlite.Handle("std::vector<float>")

for i, event in enumerate(events):
    if i >= 5: break        # only first 5 events
    print "Event" , i
    event.getByLabel("generalTracks", tracks)
    event.getByLabel("generalTracks", "MVAValues", MVAs)

    numTotal = tracks.product().size()
    if numTotal == 0: continue
    numLoose = 0
    numTight = 0
    numHighPurity = 0


    for j, (track, mva) in enumerate(zip(tracks.product(), MVAs.product()):
	if track.quality(track.qualityByName("loose")):		numLoose	+= 1
	if track.quality(track.qualityByName("tight")):		numTight	+= 1
	if track.quality(track.qualityByName("highPurity")):	numHighPurity	+= 1
	

        print "     Track", j,
        print "\t charge/pT: %.3f" %(track.charge()/track.pt()),
        print "\t phi: %.3f" %track.phi(),
        print "\t eta: %.3f" %track.eta(),
        print "\t dxy: %.4f" %track.dxy(),
        print "\t dz: %.4f" %track.dz(),
	print "\t nHits: %s" %track.numberOfValidHits(), "(%s P+ %s S)"%(track.hitPattern().numberOfValidPixelHits(),track.hitPattern().numberOfValidStripHits()),
	print "\t algo: %s" %tracks.algoName(),
	print "\t mva: %.3f" %mva


print "Event", i,
print "numTotal:", numTotal,
print "numLoose:", numLoose, "(%.1f %%)"%(float(numLoose)/numTotal*100),
print "numTight:", numTight, "(%.1f %%)"%(float(numTight)/numTotal*100),
print "numHighPurity:", numHighPurity, "(%.1f %%)"%(float(numHighPurity)/numTotal*100)

