// -*- C++ -*-
//
// Package:    MyDirectory/PrintOutTracks
// Class:      PrintOutTracks
//
/**\class PrintOutTracks PrintOutTracks.cc MyDirectory/PrintOutTracks/plugins/PrintOutTracks.cc

 Description: [one line class summary]

 Implementation:
     [Notes on implementation]
*/
//
// Original Author:  Joshua Bistany Riebman
//         Created:  Wed, 14 Jun 2023 15:51:57 GMT
//
//


// system include files
#include <memory>
#include <iostream>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/one/EDAnalyzer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
 #include "FWCore/Utilities/interface/InputTag.h"
 #include "DataFormats/TrackReco/interface/Track.h"
 #include "DataFormats/TrackReco/interface/TrackFwd.h"
//
// class declaration
//

// If the analyzer does not use TFileService, please remove
// the template argument to the base class so the class inherits
// from  edm::one::EDAnalyzer<>
// This will improve performance in multithreaded jobs.


using reco::TrackCollection;

class PrintOutTracks : public edm::one::EDAnalyzer<edm::one::SharedResources>  {
   public:
      explicit PrintOutTracks(const edm::ParameterSet&);
      ~PrintOutTracks();

      static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);


   private:
      virtual void beginJob() override;
      virtual void analyze(const edm::Event&, const edm::EventSetup&) override;
      virtual void endJob() override;

      // ----------member data ---------------------------
edm::EDGetTokenT<edm::View<reco::Track> > tracksToken_;  //used to select which tracks to read from configuration file
int indexEvent_;
};

//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
PrintOutTracks::PrintOutTracks(const edm::ParameterSet& iConfig)
 :
  tracksToken_(consumes<edm::View<reco::Track> >(iConfig.getUntrackedParameter<edm::InputTag>("tracks", edm::InputTag("generalTracks")) ))

{
   //now do what ever initialization is needed
indexEvent_=0;
}


PrintOutTracks::~PrintOutTracks()
{

   // do anything here that needs to be done at desctruction time
   // (e.g. close files, deallocate resources etc.)

}


//
// member functions
//

// ------------ method called for each event  ------------
void
PrintOutTracks::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   using namespace edm;

   for(const auto& track : iEvent.get(tracksToken_) ) {
   std::cout << "Event " << indexEvent_ << std::endl;

   edm::Handle<edm::View<reco::Track> > trackHandle;
   iEvent.getByToken(tracksToken_, trackHandle);
   if ( !trackHandle.isValid() ) return;
   const edm::View<reco::Track>& tracks = *trackHandle;
   size_t iTrack = 0;
   for ( auto track : tracks ) {
     std::cout << "    Track " << iTrack << " "
        << track.charge()/track.pt() << " "
               << track.phi() << " "
               << track.eta() << " "
               << track.dxy() << " "
               << track.dz()
        << std::endl;
     iTrack++;
   }
   ++indexEvent_;
   }

#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE
   ESHandle<SetupData> pSetup;
   iSetup.get<SetupRecord>().get(pSetup);
#endif
}


// ------------ method called once each job just before starting event loop  ------------
void
PrintOutTracks::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void
PrintOutTracks::endJob()
{
}

// ------------ method fills 'descriptions' with the allowed parameters for the module  ------------
void
PrintOutTracks::fillDescriptions(edm::ConfigurationDescriptions& descriptions) {
  //The following says we do not know what parameters are allowed so do no validation
  // Please change this to state exactly what you do use, even if it is no parameters
  edm::ParameterSetDescription desc;
  desc.setUnknown();
  descriptions.addDefault(desc);

  //Specify that only 'tracks' is allowed
  //To use, remove the default given above and uncomment below
  //ParameterSetDescription desc;
  //desc.addUntracked<edm::InputTag>("tracks","ctfWithMaterialTracks");
  //descriptions.addDefault(desc);
}

//define this as a plug-in
DEFINE_FWK_MODULE(PrintOutTracks);
