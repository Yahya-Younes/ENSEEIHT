package simplepdl.manip;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import petrinet.PetriNet;
import petrinet.PetriNetElement;
import petrinet.PetriNetFactory;
import petrinet.PetriNetPackage;
import petrinet.Arc;
import petrinet.ArcType;
import petrinet.Noeud;
import petrinet.Place;
import petrinet.Transition;

import simplepdl.Process;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;


public class DeSimplePDLversPetriNet {

	public static void main(String[] args) {
		
		// Etape 1 : Préparer les ressources à travailler avec :
		
		// Chargement du package SimplePDL afin de l'enregistrer dans le registre d'Eclipse.
		SimplepdlPackage packageInstance = SimplepdlPackage.eINSTANCE;
		
		// Enregistrer l'extension ".xmi" comme devant être ouverte à
		// l'aide d'un objet "XMIResourceFactoryImpl"
		Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
		Map<String, Object> m = reg.getExtensionToFactoryMap();
		m.put("xmi", new XMIResourceFactoryImpl());
		
		// Créer un objet resourceSetImpl qui contiendra une ressource EMF (modèle SimplePDL)
		ResourceSet resSetSimplePDL = new ResourceSetImpl();

		// Charger la ressource (modèle SimplePDL)
		URI modelURISimplePDL = URI.createURI("models/Process.xmi");
		Resource resourceSimplePDL = resSetSimplePDL.getResource(modelURISimplePDL, true);
		
		// Créer un objet resourceSetImpl qui contiendra une ressource EMF (modèle PetriNet)
		ResourceSet resSetPetriNet = new ResourceSetImpl();

		// Définir la ressource (modèle PetriNet)
		URI modelURIPetriNet = URI.createURI("models/Petri.xmi");
		Resource resourcePetriNet = resSetPetriNet.createResource(modelURIPetriNet);
		
		
		// Etape 2 : Faire la transformation en récupérant les elements du Process et
		// en créant des elements du PetriNet (Suivant la logique faite dans la correction
		// du TD1)
		
		//Rappel de la logique : pour chaque WorkDefinition on crée 3 places et 2 transitions
		//liés par 4 arcs normaux
		// pour chaque WorkSequence on crée un readArc allant d'une place
		// du WorkDefinition predecessur vers un transition du WorkDefinition
		//successur, le choix de la place et la transition se fait selon le WorkSequenceType.
		
		// Récupérer le premier élément du modèle (élément racine)
		Process process = (Process) resourceSimplePDL.getContents().get(0);
		
		// La fabrique pour fabriquer les éléments de PetriNet
	    PetrinetFactory PetriNetFactory = PetrinetFactory.eINSTANCE;
	    
	    // Créer un élément PetriNet et l'ajouter dans le modèle PetriNet
	    PetriNet petrinet = PetriNetFactory.createPetriNet();
	    petrinet.setName("Petri");
	    resourcePetriNet.getContents().add(petrinet);
	    
	    //FOCUS ON THIS THAT'S THE IMPORTANT STUFF
	    
	    // Listes pour stocker tous les places et les transitions crées, 
	    // sera utile pour le readArc qui relie les 2 sous-petriNets associés aux deux activités correspondantes
	    List<Place> places = new ArrayList<Place>();
	    List<Transition> transitions = new ArrayList<Transition>();
	    
	    // Etape 1 : créer le sous-petriNet associée à une WorkDefinition
	    for (Object o : process.getProcessElements()) {
	    	if (o instanceof WorkDefinition) {
	    		WorkDefinition wd = (WorkDefinition) o;
	    		
	    		Place wd_ready = PetriNetFactory.createPlace();
	    		wd_ready.setName(wd.getName() + "_ready");
	    		wd_ready.setNbJeton(1);
	    		petrinet.getPetrinetelement().add(wd_ready);
	    		
	    		Transition wd_start = PetriNetFactory.createTransition();
	    		wd_start.setName(wd.getName()+"_start");
	    		petrinet.getPetrinetelement().add(wd_start);
	    		
	    		Place wd_running = PetriNetFactory.createPlace();
	    		wd_running.setName(wd.getName() + "_running");
	    		wd_running.setNbJeton(0);
	    		petrinet.getPetrinetelement().add(wd_running);
	    		
	    		Place wd_started = PetriNetFactory.createPlace();
	    		wd_started.setName(wd.getName() + "_started");
	    		wd_started.setNbJeton(0);
	    		petrinet.getPetrinetelement().add(wd_started);
	    		
	    		Transition wd_finish = PetriNetFactory.createTransition();
	    		wd_finish.setName(wd.getName()+"_start");
	    		petrinet.getPetrinetelement().add(wd_finish);
	    		
	    		Place wd_finished = PetriNetFactory.createPlace();
	    		wd_finished.setName(wd.getName() + "_finished");
	    		wd_finished.setNbJeton(0);
	    		petrinet.getPetrinetelement().add(wd_finished);
	    		
	    		Arc arc1 = PetriNetFactory.createArc();
	    		arc1.setPoids(1);
	    		arc1.setLinkType(ArcType.NORMAL);
	    		arc1.setPredecessor(wd_ready);
	    		arc1.setSuccessor(wd_start);
	    		petrinet.getPetrinetelement().add(arc1);
	    		
	    		Arc arc2 = PetriNetFactory.createArc();
	    		arc2.setPoids(1);
	    		arc2.setLinkType(ArcType.NORMAL);
	    		arc2.setPredecessor(wd_start);
	    		arc2.setSuccessor(wd_started);
	    		petrinet.getPetrinetelement().add(arc2);
	    		
	    		Arc arc2_2 = PetriNetFactory.createArc();
	    		arc2_2.setPoids(1);
	    		arc2_2.setLinkType(ArcType.NORMAL);
	    		arc2_2.setPredecessor(wd_start);
	    		arc2_2.setSuccessor(wd_running);
	    		petrinet.getPetrinetelement().add(arc2_2);
	    		
	    		Arc arc3 = PetriNetFactory.createArc();
	    		arc3.setPoids(1);
	    		arc3.setLinkType(ArcType.NORMAL);
	    		arc3.setPredecessor(wd_started);
	    		arc3.setSuccessor(wd_finish);
	    		petrinet.getPetrinetelement().add(arc3);
	    		
	    		Arc arc4 = PetriNetFactory.createArc();
	    		arc4.setPoids(1);
	    		arc4.setLinkType(ArcType.NORMAL);
	    		arc4.setPredecessor(wd_finish);
	    		arc4.setSuccessor(wd_finished);
	    		petrinet.getPetrinetelement().add(arc4);
	    		
	    		places.add(wd_started);
	    		places.add(wd_finished);
	    		
	    		transitions.add(wd_start);
	    		transitions.add(wd_finish);
	    	}
	    }
	    
	    // Etape 2: Créer le read selon le type du WorkSequence
	    for (Object o : process.getProcessElement()) {
	    	if (o instanceof WorkSequence) {
	    		WorkSequence ws = (WorkSequence) o;
	    		WorkDefinition pre = ws.getPredecessor();
	    		WorkDefinition succ = ws.getSuccessor();
	    		
	    		Arc read = PetriNetFactory.createArc();
	    		read.setPoids(1);
	    		read.setLinkType(ArcType.READ);
	    		
	    		if (ws.getLinkType().equals(WorkSequenceType.START_TO_START)) {
		    		for (Place pl : places) {
		    			if (pl.getName().equals(pre.getName()+"_started")) {
		    				read.setPredecessor(pl);
		    			}
		    		}
		    		for (Transition tr : transitions) {
		    			if (tr.getName().equals(succ.getName()+"_start")) {
		    				read.setSuccessor(tr);
		    			}
		    		}
	    		} else if (ws.getLinkType().equals(WorkSequenceType.START_TO_FINISH)) {
		    		for (Place pl : places) {
		    			if (pl.getName().equals(pre.getName()+"_started")) {
		    				read.setPredecessor(pl);
		    			}
		    		}
		    		for (Transition tr : transitions) {
		    			if (tr.getName().equals(succ.getName()+"_finish")) {
		    				read.setSuccessor(tr);
		    			}
		    		}
	    		} else if (ws.getLinkType().equals(WorkSequenceType.FINISH_TO_START)) {
		    		for (Place pl : places) {
		    			if (pl.getName().equals(pre.getName()+"_finished")) {
		    				read.setPredecessor(pl);
		    			}
		    		}
		    		for (Transition tr : transitions) {
		    			if (tr.getName().equals(succ.getName()+"_start")) {
		    				read.setSuccessor(tr);
		    			}
		    		}
	    		} else {
		    		for (Place pl : places) {
		    			if (pl.getName().equals(pre.getName()+"_finished")) {
		    				read.setPredecessor(pl);
		    			}
		    		}
		    		for (Transition tr : transitions) {
		    			if (tr.getName().equals(succ.getName()+"_finish")) {
		    				read.setSuccessor(tr);
		    			}
		    		}
	    		}
	    		petrinet.getPetrielement().add(read);
	    		
	    	}
	    }
	    
	    //Sauvegarder le PetriNet 
	    try {
	    	resourcePetriNet.save(Collections.EMPTY_MAP);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	    /*
	    for (Object o : process.getProcessElements()) {
	    	if (o instanceof WorkSequence) {
	    		WorkSequence ws = (WorkSequence) o;
	    		WorkDefinition pre = ws.getPredecessor();
	    		WorkDefinition succ = ws.getSuccessor();
	    		
	    		//Créer le réseau de pétri de la WorkDefinition du precedesseur
	    		Place pre_ready = PetriNetFactory.createPlace();
	    		pre_ready.setName(pre.getName() + "_ready");
	    		pre_ready.setToken(1);
	    		petrinet.getPetrielements().add(pre_ready);
	    		
	    		Transition pre_start = PetriNetFactory.createTransition();
	    		pre_start.setName(pre.getName()+"_start");
	    		petrinet.getPetrielements().add(pre_start);
	    		
	    		Place pre_started = PetriNetFactory.createPlace();
	    		pre_started.setName(pre.getName() + "_started");
	    		pre_started.setToken(0);
	    		petrinet.getPetrielements().add(pre_started);
	    		
	    		Transition pre_finish = PetriNetFactory.createTransition();
	    		pre_finish.setName(pre.getName()+"_start");
	    		petrinet.getPetrielements().add(pre_finish);
	    		
	    		Place pre_finished = PetriNetFactory.createPlace();
	    		pre_finished.setName(pre.getName() + "_finished");
	    		pre_finished.setToken(0);
	    		petrinet.getPetrielements().add(pre_finished);
	    		
	    		Arc pre_arc1 = PetriNetFactory.createArc();
	    		pre_arc1.setCost(1);
	    		pre_arc1.setLinkType(ArcType.NORMAL_ARC);
	    		pre_arc1.setPredecessor(pre_ready);
	    		pre_arc1.setSuccessor(pre_start);
	    		petrinet.getPetrielements().add(pre_arc1);
	    		
	    		Arc pre_arc2 = PetriNetFactory.createArc();
	    		pre_arc2.setCost(1);
	    		pre_arc2.setLinkType(ArcType.NORMAL_ARC);
	    		pre_arc2.setPredecessor(pre_start);
	    		pre_arc2.setSuccessor(pre_started);
	    		petrinet.getPetrielements().add(pre_arc2);
	    		
	    		Arc pre_arc3 = PetriNetFactory.createArc();
	    		pre_arc3.setCost(1);
	    		pre_arc3.setLinkType(ArcType.NORMAL_ARC);
	    		pre_arc3.setPredecessor(pre_started);
	    		pre_arc3.setSuccessor(pre_finish);
	    		petrinet.getPetrielements().add(pre_arc3);
	    		
	    		//Créer le réseau de pétri de la WorkDefinition du successeur
	    		Place succ_ready = PetriNetFactory.createPlace();
	    		succ_ready.setName(succ.getName() + "_ready");
	    		succ_ready.setToken(1);
	    		petrinet.getPetrielements().add(succ_ready);
	    		
	    		Transition succ_start = PetriNetFactory.createTransition();
	    		succ_start.setName(succ.getName()+"_start");
	    		petrinet.getPetrielements().add(succ_start);
	    		
	    		Place succ_started = PetriNetFactory.createPlace();
	    		succ_started.setName(succ.getName() + "_started");
	    		succ_started.setToken(0);
	    		petrinet.getPetrielements().add(succ_started);
	    		
	    		Transition succ_finish = PetriNetFactory.createTransition();
	    		succ_finish.setName(succ.getName()+"_start");
	    		petrinet.getPetrielements().add(succ_finish);
	    		
	    		Place succ_finished = PetriNetFactory.createPlace();
	    		succ_finished.setName(succ.getName() + "_finished");
	    		succ_finished.setToken(0);
	    		petrinet.getPetrielements().add(succ_finished);
	    		
	    		Arc succ_arc1 = PetriNetFactory.createArc();
	    		succ_arc1.setCost(1);
	    		succ_arc1.setLinkType(ArcType.NORMAL_ARC);
	    		succ_arc1.setPredecessor(succ_ready);
	    		succ_arc1.setSuccessor(succ_start);
	    		petrinet.getPetrielements().add(succ_arc1);
	    		
	    		Arc succ_arc2 = PetriNetFactory.createArc();
	    		succ_arc2.setCost(1);
	    		succ_arc2.setLinkType(ArcType.NORMAL_ARC);
	    		succ_arc2.setPredecessor(succ_start);
	    		succ_arc2.setSuccessor(succ_started);
	    		petrinet.getPetrielements().add(succ_arc2);
	    		
	    		Arc succ_arc3 = PetriNetFactory.createArc();
	    		succ_arc3.setCost(1);
	    		succ_arc3.setLinkType(ArcType.NORMAL_ARC);
	    		succ_arc3.setPredecessor(succ_started);
	    		succ_arc3.setSuccessor(succ_finish);
	    		petrinet.getPetrielements().add(succ_arc3);
	    		
	    		Arc succ_arc4 = PetriNetFactory.createArc();
	    		succ_arc4.setCost(1);
	    		succ_arc4.setLinkType(ArcType.NORMAL_ARC);
	    		succ_arc4.setPredecessor(succ_finish);
	    		succ_arc4.setSuccessor(succ_finished);
	    		petrinet.getPetrielements().add(succ_arc4);
	    		
	    		if (ws.getLinkType().equals(WorkSequenceType.START_TO_START)) {
	    			Arc readArc = PetriNetFactory.createArc();
	    			readArc.setCost(1);
	    			
	    		}
	    	}
	    }
	    */

	}

}
