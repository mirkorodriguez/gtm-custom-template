___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cstmtag_mr",
  "version": 1.4,
  "securityGroups": [
    "NON_GOOGLE_SCRIPTS"
  ],
  "displayName": "Custom Tag",
    "categories": [
      "CONVERSIONS",
      "TAG_MANAGEMENT"
  ],
  "brand": {
    "displayName": "Custom Tag",
    "id": "brand_pcstmtag_mr"
  },
  "description": "Tag to fire events.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "notSetText": "Not set (Required)",
    "help": "Enter your tag ID. You can find your tags at https://ads.pinterest.com/conversion_tags/",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "26\\d{11}"
        ],
        "type": "REGEX"
      }
    ],
    "displayName": "Tag ID",
    "name": "tagId",
    "type": "TEXT",
    "valueHint": "Pinterest Tag ID"
  },
  {
    "notSetText": "Not set (required for Enhanced Match)",
    "help": "Optional, but required for Enhanced Match. This is the user\u0027s email address, stripped of whitespace, lower-cased, then hashed with MD5, SHA1, or SHA-256. As a fallback, a raw email address can also be used. In this case, we will hash the email address for you, in the browser. (The email address *never* leaves the browser, and Pinterest never sees it.) See https://help.pinterest.com/en/business/article/enhanced-match for more information.",
    "displayName": "Hashed Email",
    "name": "em",
    "type": "TEXT",
    "valueHint": "{{email}}"
  },
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Base Code Only (no event)",
        "value": ""
      },
      {
        "displayValue": "Add Payment Info",
        "value": "addpaymentinfo"
      },
      {
        "displayValue": "Add to Cart",
        "value": "addtocart"
      },
      {
        "displayValue": "Add to Wishlist",
        "value": "addtowishlist"
      },
      {
        "displayValue": "Checkout",
        "value": "checkout"
      },
      {
        "displayValue": "Custom (legacy)",
        "value": "custom"
      },
      {
        "displayValue": "Initiate Checkout",
        "value": "initiatecheckout"
      },
      {
        "displayValue": "Lead",
        "value": "lead"
      },
      {
        "displayValue": "Page Visit",
        "help": "Track visits to specific pages on your website.",
        "value": "pagevisit"
      },
      {
        "displayValue": "Search",
        "value": "search"
      },
      {
        "displayValue": "Signup",
        "value": "signup"
      },
      {
        "displayValue": "Subscribe",
        "value": "subscribe"
      },
      {
        "displayValue": "View Category",
        "value": "viewcategory"
      },
      {
        "displayValue": "View Content",
        "value": "viewcontent"
      },
      {
        "displayValue": "Watch Video",
        "value": "watchvideo"
      },
      {
        "displayValue": "Custom Event",
        "value": "ADE"
      }
    ],
    "displayName": "Event to Fire",
    "name": "eventName",
    "type": "SELECT"
  },
  {
    "help": "This allows you to define your own custom event name.",
    "displayName": "Event name:",
    "name": "adeEventName",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "ADE"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "^[a-zA-Z_]+$"
        ],
        "type": "REGEX"
      }
    ],
  },
  {
    "help": "Enter optional order information here. Setting these values is highly recommended to improve conversions and reporting.",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "checkout"
      },
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "addtocart"
      }
    ],
    "displayName": "Cart Parameters",
    "name": "checkout",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Make sure to set a currency code to ensure proper currency conversion; otherwise, we\u0027ll default to USD.",
        "displayName": "Order Value",
        "name": "value",
        "type": "TEXT"
      },
      {
        "help": "Must be one of USD, GBP, CAD, EUR, AUD or NZD. If you don\u0027t set a currency code, we\u0027ll default to USD.",
        "valueValidators": [
          {
            "args": [
              3,
              3
            ],
            "errorMessage": "Please enter a valid currency.",
            "type": "STRING_LENGTH"
          }
        ],
        "displayName": "Currency",
        "name": "currency",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "type": "NUMBER"
          }
        ],
        "displayName": "Order Quantity",
        "name": "order_quantity",
        "type": "TEXT"
      },
      {
        "displayName": "Order ID",
        "simpleValueType": true,
        "name": "order_id",
        "type": "TEXT"
      }
    ]
  },
  {
    "help": "These fields are required for dynamic retargeting on Pinterest. Optional otherwise.",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "pagevisit"
      },
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "addtocart"
      },
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "checkout"
      }
    ],
    "displayName": "Line Items",
    "name": "line_items",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Product ID",
        "simpleValueType": true,
        "name": "product_id",
        "type": "TEXT"
      },
      {
        "displayName": "Product Category",
        "simpleValueType": true,
        "name": "product_category",
        "type": "TEXT"
      }
    ]
  },
  {
    "help": "Optional field to set the lead type.",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "lead"
      },
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "signup"
      }
    ],
    "displayName": "Lead Type",
    "name": "lead_type",
    "type": "TEXT"
  },
  {
    "help": "Search Keywords",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "EQUALS",
        "paramValue": "search"
      }
    ],
    "displayName": "Search Query",
    "name": "search_query",
    "type": "TEXT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "eventName",
        "type": "NOT_EQUALS",
        "paramValue": ""
      }
    ],
    "name": "setCustomParams",
    "checkboxText": "Custom Parameters",
    "type": "CHECKBOX",
    "subParams": [
      {
        "enablingConditions": [
          {
            "paramName": "setCustomParams",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "name": "customParameters",
        "groupStyle": "NO_ZIPPY",
        "type": "GROUP",
        "subParams": [
          {
            "name": "values",
            "simpleTableColumns": [
              {
                "selectItems": [],
                "defaultValue": "",
                "displayName": "Name",
                "name": "name",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT"
              }
            ],
            "type": "SIMPLE_TABLE"
          }
        ]
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "setOptOut",
    "checkboxText": "Opt Out Information",
    "simpleValueType": true,
    "help": "If checked, you could set the Opt Out Information for Privacy regulations such as CCPA."
  },
  {
    "help": "'opt_out_type' is the field where we accept opt outs for your users' privacy preference. \u003cbr\u003e\u003cbr\u003e It can handle multiple values with commas separated. Current accepted value is \u003cb\u003eLDP\u003c/b\u003e for Limited Data Processing.",
    "displayName": "Opt Out Type",
    "name": "opt_out_type",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "setOptOut",
        "type": "EQUALS",
        "paramValue": true
      }
    ]
  },
  {
    "help": "'st' is the field for sharing a user's \u003cb\u003estate of residency\u003c/b\u003e in connection with use of the LDP flag. Please note that the LDP flag does not currently have any effect for users outside of the State of California. \u003cbr\u003e\u003cbr\u003e The state names we accept are SHA256 hashed, standard USPS state abbreviations with two characters (e.g., 'CA').",
    "displayName": "State",
    "name": "st",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "setOptOut",
        "type": "EQUALS",
        "paramValue": true
      }
    ]
  },
  {
    "help": "'country' is the field in which you pass a user’s country of residency in connection with use of the LDP flag. Please note that the LDP flag does not currently have any effect for users outside of the State of California. \u003cbr\u003e\u003cbr\u003e The country names we accept are SHA256 hashed, standard ISO-3166 country codes with two characters (e.g., 'US', 'DE').",
    "displayName": "Country",
    "name": "country",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "setOptOut",
        "type": "EQUALS",
        "paramValue": true
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "aem_upsell",
    "displayName": "\u003cb\u003eEnable automatic enhanced match? \u003c/b\u003eAutomatic enhanced match can help attribute more conversions to your Pinterest ads and increase audience sizes. Navigate to \u003ca href\u003d\"https://ads.pinterest.com/conversions/tag\"\u003ePinterest Ads Manager\u003c/a\u003e to enable. \u003ca href\u003d\"https://help.pinterest.com/business/article/automatic-enhanced-match\"\u003eLearn more\u003c/a\u003e\u003c/br\u003e"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const createArgumentsQueue = require('createArgumentsQueue');
const injectScript = require('injectScript');
const log = require('logToConsole');
const makeTableMap = require('makeTableMap');
const JSON = require('JSON');

/**
 * This GTM snippet takes care of loading the Pinterest tag and firing events.
 * It is roughly equivalent to installing the Pinterest Tag base code and then
 * using pintrk() to fire events. It will do the base tag functionality only
 * once so you can load and call this multiple times without worrying multiple
 * loads, etc.
 */
log('GTM PTag v1.4; tagId: ' + data.tagId);

// Check to see if we've already created the queue.
const isFirstLoad = !copyFromWindow('pintrk');

// Set up window.pintrk. Won't re-create if it already exists.
const pintrk = createArgumentsQueue('pintrk', 'pintrk.queue');

/**
 * First-time Load/Initialization.
 */
if (isFirstLoad) {
  // OK to call 'load' and 'page' events before injecting script,
  // it will process existing items in the queue on load.
  const initializationData = {
    'np': 'gtm',
  };
  if (data.em) {
    initializationData.em = data.em;
  }
  // Set opt_out params
  setOptOutParams(data, initializationData);
  pintrk('load', data.tagId.toString(), initializationData);
  pintrk('page');
} else {
  const partnerDataUpdate = {};
  if (data.em) {
    partnerDataUpdate.em = data.em;
  }
  // Override opt_out params
  overrideOptOutParams(data, partnerDataUpdate);
  pintrk('set', partnerDataUpdate);
}

// Special case: this if block is written to handle the case where the base
// code is fired after another event, which would cause isFirstLoad to run
// but not include config values
if (data.eventName === "") {
  const partnerDataUpdate = {};
  setOptOutParams(data, partnerDataUpdate);
  pintrk('set', partnerDataUpdate);
}

// Set opt_out params
function setOptOutParams(data, pdObject) {
  if (data.setOptOut) {
    if (data.opt_out_type) {
      pdObject.opt_out_type = data.opt_out_type;
    }
    if (data.st) {
      pdObject.st = data.st;
    }
    if (data.country) {
      pdObject.country = data.country;
    }
  }
}

// Override opt_out params
function overrideOptOutParams(data, pdObject) {
  if (data.setOptOut) {
    pdObject.opt_out_type = data.opt_out_type ? data.opt_out_type : undefined;
    pdObject.st = data.st ? data.st : undefined;
    pdObject.country = data.country ? data.country : undefined;
  } else {
    pdObject.opt_out_type = undefined;
    pdObject.st = undefined;
    pdObject.country = undefined;
  }
}

/**
 * Define function to setup event data and call pintrk() as needed.
 * Intentionally verbose for completeness.
 */
const onSuccess = function() {

  let eventData = {};

  // Copy custom parameters, if any, into eventData.
  // We do this first so that in case someone has defined
  // a custom parameter with the same name as a top-level
  // field, then the top-level field will take precedence.
  if (data.setCustomParams) {
    eventData = makeTableMap(data.values, 'name', 'value');
  }

  // In the extremely unlikely event that someone has created a 'np'
  // custom field, we make sure to override that.
  eventData.np = 'gtm';

  const safeCopyField = (fieldName) => {
    if (data[fieldName] !== undefined) {
      eventData[fieldName] = data[fieldName];
    }
  };

  const safeCopyLineItem = (fieldName) => {
    if (data[fieldName] !== undefined) {
      if (eventData.line_items === undefined) {
        eventData.line_items = [{}];
      }
      eventData.line_items[0][fieldName] = data[fieldName];
    }
  };

  switch (data.eventName) {
    case 'watchvideo':   // No fields defined.
    case 'viewcategory': // No fields defined.
    case 'custom':       // Only custom fields, none preconfigured.
      break;
    case 'signup':       // Signup and Lead share the same single field.
    case 'lead':
      safeCopyField('lead_type');
      break;
    case 'search':
      safeCopyField('search_query');
      break;
    case 'addtocart':    // AddToCart and Checkout share the same fields.
    case 'checkout':
      safeCopyField('order_id');
      safeCopyField('order_quantity');
      safeCopyField('value');
      safeCopyField('currency');
      // Intentional fall-through, page vist has only ID and category.
    case 'pagevisit':
      safeCopyLineItem('product_id');
      safeCopyLineItem('product_category');
      break;
    default:
      // Just fallthrough as server-side code will take care of
      // emitting an error message to the console.
      break;
  }

  if (data.eventName !== '') {
    let finalEventName = data.eventName;

    // ADE events
    if (finalEventName === 'ADE') {
      log('ADE name: ' + data.adeEventName);
      finalEventName = data.adeEventName;
    }

    log('Firing Pinterest event: ' + finalEventName);
    log('Event Data:' + JSON.stringify(eventData));
    pintrk('track', finalEventName, eventData);
  }
  data.gtmOnSuccess();
};

/**
 * Failure callback; server-size JS didn't load, log error and exit.
 */
const onFailure = function() {
  log('Pinterest Error: Loading JS failed!');
  data.gtmOnFailure();
};

// Async load
injectScript("https://s.pinimg.com/ct/core.js", onSuccess, onFailure, 'PinterestJS');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "pintrk"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "pintrk.queue"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://s.pinimg.com/ct/core.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Points of Contact: www.mirkorodriguez.com