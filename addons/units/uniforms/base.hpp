class Uniform_Base;


// Uniforms
class UniformItem;
class CLASS(Uniform_Base): Uniform_Base {
    dlc = QUOTE(PREFIX);
    scope = 0;
    model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";

    class ItemInfo: UniformItem {
        uniformModel = "-";
        containerClass = "Supply40";
        mass = 40;
    };
};
class CLASS(Uniform_Base_Floral): CLASS(Uniform_Base) {
    model = "\A3\Characters_F\Common\Suitpacks\suitpack_civilian_F.p3d";

    class ItemInfo: UniformItem {
        uniformModel = "-";
        containerClass = "Supply40";
        mass = 40;
    };
};
