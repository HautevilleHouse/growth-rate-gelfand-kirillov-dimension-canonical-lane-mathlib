import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GKAdmittedObject where
  package : GrowthRateGKPackage
  evidence : GrowthRateGKEvidence package
  conclusion : GrowthRateGKClosed package

structure GKAdmissibleClass where
  object : GKAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : GKAdmissibleClass) : Prop :=
  GrowthRateGKClosed A.object.package ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
