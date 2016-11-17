/*
    Types (SCALAR, BOOL, STRING, ARRAY)
*/

class DOUBLES(PREFIX,settings) {
    class GVAR(enable) {
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(name) {
        typeName = "STRING";
        value = "FOB Saturn";
    };
    class GVAR(range) {
        typeName = "SCALAR";
        value = 200;
    };
    class GVAR(whitelist) {
        typeName = "ARRAY";
        value[] = {"ALL"};
    };
    class GVAR(pbnames) {
        typeName = "ARRAY";
		value[] = {
            {"PB Venus","PB Mercury","PB Mars"}
        };
    };
    class GVAR(pbrange) {
        typeName = "SCALAR";
        value = 100;
    };
};
