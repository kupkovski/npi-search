module SearchHelper
  def state_options
    [
      ['Any', '',    ],
      ['ALABAMA ', '1: AL'],
      ['ALASKA ', '2: AK'],
      ['AMERICAN SAMOA ', '3: AS'],
      ['ARIZONA ', '4: AZ'],
      ['ARKANSAS ', '5: AR'],
      ['ARMED FORCES AMERICA ', '6: AA'],
      ['ARMED FORCES EUROPE/CANADA/MIDDLE EAST/AFRICA ', '7: AE'],
      ['ARMED FORCES PACIFIC ', '8: AP'],
      ['CALIFORNIA ', '9: CA'],
      ['COLORADO ', '10: CO'],
      ['CONNECTICUT ', '11: CT'],
      ['DELAWARE ', '12: DE'],
      ['DISTRICT OF COLUMBIA ', '13: DC'],
      ['FLORIDA ', '14: FL'],
      ['GEORGIA ', '15: GA'],
      ['GUAM ', '16: GU'],
      ['HAWAII ', '17: HI'],
      ['IDAHO ', '18: ID'],
      ['ILLINOIS ', '19: IL'],
      ['INDIANA ', '20: IN'],
      ['IOWA ', '21: IA'],
      ['KANSAS ', '22: KS'],
      ['KENTUCKY ', '23: KY'],
      ['LOUISIANA ', '24: LA'],
      ['MAINE ', '25: ME'],
      ['MARIANA ISLANDS, NORTHERN ', '26: MP'],
      ['MARSHALL ISLANDS ', '27: MH'],
      ['MARYLAND ', '28: MD'],
      ['MASSACHUSETTS ', '29: MA'],
      ['MICHIGAN ', '30: MI'],
      ['MICRONESIA, FEDERATED STATES OF ', '31: FM'],
      ['MINNESOTA ', '32: MN'],
      ['MISSISSIPPI ', '33: MS'],
      ['MISSOURI ', '34: MO'],
      ['MONTANA ', '35: MT'],
      ['NEBRASKA ', '36: NE'],
      ['NEVADA ', '37: NV'],
      ['NEW HAMPSHIRE ', '38: NH'],
      ['NEW JERSEY ', '39: NJ'],
      ['NEW MEXICO ', '40: NM'],
      ['NEW YORK ', '41: NY'],
      ['NORTH CAROLINA ', '42: NC'],
      ['NORTH DAKOTA ', '43: ND'],
      ['OHIO ', '44: OH'],
      ['OKLAHOMA ', '45: OK'],
      ['OREGON ', '46: OR'],
      ['PENNSYLVANIA ', '47: PA'],
      ['PUERTO RICO ', '48: PR'],
      ['RHODE ISLAND ', '49: RI'],
    ]
  end

  def country_options
    [
      ["Any", ""],
      ["Afghanistan", "1: AF"],
      ["Aland Islands", "2: AX"],
      ["Albania", "3: AL"],
      ["Algeria", "4: DZ"],
      ["Andorra", "5: AD"],
      ["Angola", "6: AO"],
      ["Anguilla", "7: AI"],
      ["Antarctica", "8: AQ"],
      ["Antigua and Barbuda", "9: AG"],
      ["Argentina", "10: AR"],
      ["Armenia", "11: AM"],
      ["Aruba", "12: AW"],
      ["Australia", "13: AU"],
      ["Austria", "14: AT"],
      ["Azerbaijan", "15: AZ"],
      ["Bahamas", "16: BS"],
      ["Bahrain", "17: BH"],
      ["Bangladesh", "18: BD"],
      ["Barbados", "19: BB"],
      ["Belarus", "20: BY"],
      ["Belgium", "21: BE"],
      ["Belize", "22: BZ"],
      ["Benin", "23: BJ"],
      ["Bermuda", "24: BM"],
      ["Bhutan", "25: BT"],
      ["Bolivia", "26: BO"],
      ["Bosnia and Herzegovina", "27: BA"],
      ["Botswana", "28: BW"],
      ["Bouvet Island", "29: BV"],
      ["Brazil", "30: BR"],
      ["British Indian Ocean Territory", "31: IO"],
      ["Brunei Darussalam", "32: BN"],
      ["Bulgaria", "33: BG"],
      ["Burkina Faso", "34: BF"],
      ["Burundi", "35: BI"],
      ["Cambodia", "36: KH"],
      ["Cameroon", "37: CM"],
      ["Canada", "38: CA"],
      ["Cape Verde", "39: CV"],
      ["Cayman Islands", "40: KY"],
      ["Central African Republic", "41: CF"],
      ["Chad", "42: TD"],
      ["Chile", "43: CL"],
      ["China", "44: CN"],
      ["Christmas Island", "45: CX"],
      ["Cocos (Keeling) Islands", "46: CC"],
      ["Colombia", "47: CO"],
      ["Comoros", "48: KM"],
      ["Congo", "49: CG"],
      ["Congo, The Democratic Republic of the", "50: CD"],
      ["Cook Islands", "51: CK"],
      ["Costa Rica", "52: CR"],
      ["Croatia", "53: HR"],
      ["Cuba", "54: CU"],
      ["Cyprus", "55: CY"],
      ["Czech Republic", "56: CZ"],
      ["Denmark", "57: DK"],
      ["Djibouti", "58: DJ"],
      ["Dominica", "59: DM"],
      ["Dominican Republic", "60: DO"],
      ["Ecuador", "61: EC"],
      ["Egypt", "62: EG"],
      ["El Salvador", "63: SV"],
      ["Equatorial Guinea", "64: GQ"],
      ["Eritrea", "65: ER"],
      ["Estonia", "66: EE"],
      ["Ethiopia", "67: ET"],
      ["Falkland Islands (Malvinas)", "68: FK"],
      ["Faroe Islands", "69: FO"],
      ["Fiji", "70: FJ"],
      ["Finland", "71: FI"],
      ["France", "72: FR"],
      ["French Guiana", "73: GF"],
      ["French Polynesia", "74: PF"],
      ["French Southern Territories", "75: TF"],
      ["Gabon", "76: GA"],
      ["Gambia", "77: GM"],
      ["Georgia", "78: GE"],
      ["Germany", "79: DE"],
      ["Ghana", "80: GH"],
      ["Gibraltar", "81: GI"],
      ["Great Britain", "82: GB"],
      ["Greece", "83: GR"],
      ["Greenland", "84: GL"],
      ["Grenada", "85: GD"],
      ["Guadeloupe", "86: GP"],
      ["Guatemala", "87: GT"],
      ["Guernsey", "88: GG"],
      ["Guinea", "89: GN"],
      ["Guinea-Bissau", "90: GW"],
      ["Guyana", "91: GY"],
      ["Haiti", "92: HT"],
      ["Heard Island and McDonald Islands", "93: HM"],
      ["Holy See (Vatican City State)", "94: VA"],
      ["Honduras", "95: HN"],
      ["Hong Kong", "96: HK"],
      ["Hungary", "97: HU"],
      ["Iceland", "98: IS"],
      ["India", "99: IN"],
      ["Indonesia", "100: ID"],
      ["Iran, Islamic Republic of", "101: IR"],
      ["Iraq", "102: IQ"],
      ["Ireland", "103: IE"],
      ["Isle Of Man", "104: IM"],
      ["Israel", "105: IL"],
      ["Italy", "106: IT"],
      ["Ivory Coast", "107: CI"],
      ["Jamaica", "108: JM"],
      ["Japan", "109: JP"],
      ["Jersey", "110: JE"],
      ["Jordan", "111: JO"],
      ["Kazakhstan", "112: KZ"],
      ["Kenya", "113: KE"],
      ["Kiribati", "114: KI"],
      ["Korea, Democratic People's Republic of", "115: KP"],
      ["Korea, Republic of", "116: KR"],
      ["Kosovo", "117: XK"],
      ["Kuwait", "118: KW"],
      ["Kyrgyzstan", "119: KG"],
      ["Lao People's Democratic Republic", "120: LA"],
      ["Latvia", "121: LV"],
      ["Lebanon", "122: LB"],
      ["Lesotho", "123: LS"],
      ["Liberia", "124: LR"],
      ["Libyan Arab Jamahiriya", "125: LY"],
      ["Liechtenstein", "126: LI"],
      ["Lithuania", "127: LT"],
      ["Luxembourg", "128: LU"],
      ["Macao", "129: MO"],
      ["Macedonia, The Former Yugoslav Republic of", "130: MK"],
      ["Madagascar", "131: MG"],
      ["Malawi", "132: MW"],
      ["Malaysia", "133: MY"],
      ["Maldives", "134: MV"],
      ["Mali", "135: ML"],
      ["Malta", "136: MT"],
      ["Martinique", "137: MQ"],
      ["Mauritania", "138: MR"],
      ["Mauritius", "139: MU"],
      ["Mayotte", "140: YT"],
      ["Mexico", "141: MX"],
      ["Moldova, Republic of", "142: MD"],
      ["Monaco", "143: MC"],
      ["Mongolia", "144: MN"],
      ["Montserrat", "145: MS"],
      ["Morocco", "146: MA"],
      ["Mozambique", "147: MZ"],
      ["Myanmar", "148: MM"],
      ["Namibia", "149: NA"],
      ["Nauru", "150: NR"],
      ["Nepal", "151: NP"],
      ["Netherlands", "152: NL"],
      ["Netherlands Antilles", "153: AN"],
      ["New Caledonia", "154: NC"],
      ["New Zealand", "155: NZ"],
      ["Nicaragua", "156: NI"],
      ["Niger", "157: NE"],
      ["Nigeria", "158: NG"],
      ["Niue", "159: NU"],
      ["Norfolk Island", "160: NF"],
      ["Norway", "161: NO"],
      ["Oman", "162: OM"],
      ["Pakistan", "163: PK"],
      ["Palau", "164: PW"],
      ["Palestinian Territory, Occupied", "165: PS"],
      ["Panama", "166: PA"],
      ["Papua New Guinea", "167: PG"],
      ["Paraguay", "168: PY"],
      ["Peru", "169: PE"],
      ["Philippines", "170: PH"],
      ["Pitcairn", "171: PN"],
      ["Poland", "172: PL"],
      ["Portugal", "173: PT"],
      ["Qatar", "174: QA"],
      ["Reunion", "175: RE"],
      ["Romania", "176: RO"],
      ["Russian Federation", "177: RU"],
      ["Rwanda", "178: RW"],
      ["Saint Helena", "179: SH"],
      ["Saint Kitts and Nevis", "180: KN"],
      ["Saint Lucia", "181: LC"],
      ["Saint Pierre and Miquelon", "182: PM"],
      ["Saint Vincent and the Grenadines", "183: VC"],
      ["Samoa", "184: WS"],
      ["San Marino", "185: SM"],
      ["Sao Tome and Principe", "186: ST"],
      ["Saudi Arabia", "187: SA"],
      ["Senegal", "188: SN"],
      ["Serbia and Montenegro", "189: CS"],
      ["Seychelles", "190: SC"],
      ["Sierra Leone", "191: SL"],
      ["Singapore", "192: SG"],
      ["Slovakia", "193: SK"],
      ["Slovenia", "194: SI"],
      ["Solomon Islands", "195: SB"],
      ["Somalia", "196: SO"],
      ["South Africa", "197: ZA"],
      ["South Georgia and the South Sandwich Islands", "198: GS"],
      ["Spain", "199: ES"],
      ["Sri Lanka", "200: LK"],
      ["Sudan", "201: SD"],
      ["Suriname", "202: SR"],
      ["Svalbard and Jan Mayen", "203: SJ"],
      ["Swaziland", "204: SZ"],
      ["Sweden", "205: SE"],
      ["Switzerland", "206: CH"],
      ["Syrian Arab Republic", "207: SY"],
      ["Taiwan", "208: TW"],
      ["Tajikistan", "209: TJ"],
      ["Tanzania, United Republic of", "210: TZ"],
      ["Thailand", "211: TH"],
      ["Timor-Leste", "212: TL"],
      ["Togo", "213: TG"],
      ["Tokelau", "214: TK"],
      ["Tonga", "215: TO"],
      ["Trinidad and Tobago", "216: TT"],
      ["Tunisia", "217: TN"],
      ["Turkey", "218: TR"],
      ["Turkmenistan", "219: TM"],
      ["Turks and Caicos Islands", "220: TC"],
      ["Tuvalu", "221: TV"],
      ["Uganda", "222: UG"],
      ["Ukraine", "223: UA"],
      ["United Arab Emirates", "224: AE"],
      ["United States", "225: US"],
      ["United States Minor Outlying Islands", "226: UM"],
      ["Uruguay", "227: UY"],
      ["Uzbekistan", "228: UZ"],
      ["Vanuatu", "229: VU"],
      ["Venezuela", "230: VE"],
      ["Viet Nam", "231: VN"],
      ["Virgin Islands, British", "232: VG"],
      ["Wallis and Futuna", "233: WF"],
      ["Western Sahara", "234: EH"],
      ["Yemen", "235: YE"],
      ["Zambia", "236: ZM"],
      ["Zimbabwe", "237: ZW"],
    ]
  end
end
