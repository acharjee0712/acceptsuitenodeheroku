/*global
  $,window
*/
'use strict';

var jsondata = "";
var globalVars = "";
function loadJSON() {
    $.ajax({
        url: '../../../scripts/userInputs.json',
        async: false,
        dataType: 'json',
        success: function (jsondata) {
            globalVars = {
// Default sandbox credentials
    ClientKey: '6C47PepC2NyJ2dgTy89U56xnan24H3cb363wxvBC5DP9Cjk5Fwp6b4q2YBnjU2Xp',

    ApiLoginID: '78BZ5Xprry',

    ApiTransactionKey: '8s2F95Q7brhHd7Tn',


    // Web API URL's

    AcceptJSRequestUrl : 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptJs',

    AcceptHostedRequestUrl : 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptHosted',

    AcceptCustomerRequestUrl : 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptCustomer',

    ValidateCustomerRequestUrl:'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/validateCustomer',
	// available customer id
    ValidCustomer: '1916219194'

    };
        }
    });
}
window.onload = loadJSON();