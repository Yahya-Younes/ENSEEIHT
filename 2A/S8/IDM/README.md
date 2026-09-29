# IDM – Ingénierie Dirigée par les Modèles (2A S8)

Model-driven engineering project: define a process-description language (SimplePDL),
transform processes into Petri nets and verify their properties by model-checking.

Files in [`Projet_SimplePDL_PetriNet/`](Projet_SimplePDL_PetriNet):

| Step | Files |
|---|---|
| Metamodels (Ecore) | `SimplePDL.ecore`, `PetriNet.ecore` |
| Static semantics (OCL) + counter-examples | `SimplePDL.ocl`, `PetriNet.ocl`, `*ContreExempleOCL.xmi` |
| Textual syntax (Xtext) | `PDL.xtext`, `My.simplepdl`, `My.petrinet` |
| Model-to-model transformation (Java/EMF) | `DeSimplePDLversPetriNet.java` (`simplepdl.xmi` / `Processus.xmi` → `Reseaudepetri.xmi`) |
| Model-to-text (Acceleo) | `Net2Tina.mtl` (Petri net → Tina `.net`), `toLTL.mtl` (LTL properties), `toPDL1.mtl` |
| Verification (Tina / selt) | `Petri.net`, `prop.ltl` |

Report: [`Rapport_IDM.pdf`](Projet_SimplePDL_PetriNet/Rapport_IDM.pdf).
Tooling: Eclipse Modeling Tools (EMF, OCLinEcore, Xtext, Acceleo) and the
[Tina toolbox](https://projects.laas.fr/tina/).
