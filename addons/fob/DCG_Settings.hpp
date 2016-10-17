/*
    Types (SCALAR, BOOL, STRING, ARRAY)
*/

class DOUBLES(PREFIX,settings) {
    class GVAR(enable) {
        typeName = "SCALAR";
        typeDetail = "";
        value = 1;
    };
    class GVAR(name) {
        typeName = "STRING";
        typeDetail = "";
        value = "FOB Saturn";
    };
    class GVAR(range) {
        typeName = "SCALAR";
        typeDetail = "";
        value = 200;
    };
    class GVAR(whitelist) {
        typeName = "ARRAY";
        typeDetail = "";
        value[] = {"ALL"};
    };
    class GVAR(pbnames) {
        typeName = "ARRAY";
        typeDetail = "";
		value[] = {
            {"PB Venus","PB Mercury","PB Mars"}
        };
    };
    class GVAR(pbrange) {
        typeName = "SCALAR";
        typeDetail = "";
        value = 100;
    };
};