class ImpactEffectsSmall {
    class ImpactDust1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcrete {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(lingeringDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(impactDustDust) {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactEffectsSmall06 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustDirt);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactEffectsRed {
    class ImpactDust1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDust_Red);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcrete {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(lingeringDust_Red);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(impactDustDust) {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustDust_Red);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactEffectsSmall06 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustDirt_Red);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactEffectsHardGround {
    class ImpactDust1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcrete {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(lingeringDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactConcrete {
    class ImpactDust {
        qualityLevel = -1;
        type = QGVAR(impactDust);
    };
    class GVAR(lingeringDust) {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(lingeringDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactPlaster {
    class GVAR(lingeringDust) {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(lingeringDust);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class Impactglass {
    class ImpactDust1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustglass1);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactDust2 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustglass2);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactglassThin {
    class ImpactDust1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustglass1);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactDust2 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustglass2);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactWood {
    class ImpactDustout {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactDustWoodout);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class WoodChippingsOut1 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(woodChippingsOut1);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class WoodChippingsOut2 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(woodChippingsOut2);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
};
class ImpactMetal {
    class SparksLight {
        simulation = "light";
        type = "SparksLight";
        position[] = {
            0, 0, 0
        };
        intensity = 0.001;
        interval = 1;
        lifetime = 1;
    };
    class ImpactSmoke {
        simulation = "particles";
        qualityLevel = -1;
        type = "ImpactSmoke";
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactSparks1 {
        simulation = "particles";
        qualityLevel = -1;
        type = "ImpactSparks1";
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.5;
    };
    class ImpactSparks2 {
        simulation = "particles";
        qualityLevel = -1;
        type = QGVAR(impactSpark);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.5;
    };
};
class GVAR(impactMetal_Api) {
    class SparksLight1 {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "SparksLight";
        intensity = 0.001;
        interval = 1;
        lifetime = 0.5;
    };
    class SparksLight2 {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class ImpactSparks {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSparks2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactSmoke {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSmoke2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class explosionammoFlash {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class explosionammoSmoke {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
    class explosionSparks1 {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.3;
    };
    class explosionSparks2 {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 0.001;
        lifetime = 0.3;
    };
};
class GVAR(impactglass_Api) {
    class GlassShard {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassShard1";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GlassShard2 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassShard2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GlassDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassDust";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
    class GVAR(explosionSparks1) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.3;
    };
    class GVAR(explosionSparks2) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 0.001;
        lifetime = 0.3;
    };
};
class GVAR(impactglassThin_Api) {
    class GlassShard1 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassShard1";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GlassShard2 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassShard2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GlassDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "GlassDust";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(impactWood_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactDustWood";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class WoodChippings1 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "WoodChippings1";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class WoodChippings2 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "WoodChippings2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(impactPlaster_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactDustPlaster";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcrete {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactConcrete";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
    class GVAR(explosionSparks1) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.3;
    };
    class GVAR(explosionSparks2) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 0.001;
        lifetime = 0.3;
    };
};
class GVAR(impactRubber_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSmoke";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(impactBlood_Api) {
    class Blood {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "Blood";
        intensity = 1;
        interval = 1;
        lifetime = 2;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(impactConcrete_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactDustConcrete";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactDust2 {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactDustConcrete2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcrete {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactConcrete";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactConcreteWall {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactConcreteWall1";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
    class GVAR(explosionSparks1) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 0.3;
    };
    class GVAR(explosionSparks2) {
        simulation = "particles";
        type = QGVAR(explosionSparks);
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 0.001;
        lifetime = 0.3;
    };
};
class GVAR(impactHay_Api) {
    class HayChippings1 {
        simulation = "particles";
        type = "HayChippings1";
        position[] = {
            0, 0, 0
        };
        qualityLevel = 2;
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSmoke";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
    class Sound {
        simulation = "sound";
        type = "SFX_ImpactHay";
        position[] = {
            0, 0, 0
        };
        intensity = 1;
        interval = 1;
        lifetime = 10;
    };
};
class GVAR(impactPlastic_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSmoke2";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(impactTyre_Api) {
    class ImpactDust {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "ImpactSmoke";
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 1;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.1;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 2;
    };
};
class GVAR(empty) {
    class nothing {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(noFX);
        intensity = 0;
        interval = 1;
        lifetime = 0;
    };
};
class GVAR(explosionammoexplosion_Api) {
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 0.1;
        interval = 1;
        lifetime = 0.3;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.2;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 0.4;
    };
};
class GVAR(explosionammoCrater_Api) {
    class GVAR(explosionammoStones) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = "DirtSmall";
        intensity = 0.5;
        interval = 1;
        lifetime = 1;
    };
    class GVAR(explosionammoFlash) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(explosionammoFlash);
        intensity = 0.1;
        interval = 1;
        lifetime = 0.3;
    };
    class GVAR(sparksLight) {
        position[] = {
            0, 0, 0
        };
        simulation = "light";
        type = "GrenadeexploLight";
        intensity = 0.01;
        interval = 1;
        lifetime = 0.2;
    };
    class GVAR(explosionammoSmoke) {
        position[] = {
            0, 0, 0
        };
        simulation = "particles";
        type = QGVAR(impactSmoke);
        intensity = 2;
        interval = 1;
        lifetime = 0.4;
    };
};