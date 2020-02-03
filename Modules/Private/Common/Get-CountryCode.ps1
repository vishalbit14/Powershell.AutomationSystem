<#
    .SYNOPSIS
        Get Country code from the string.

    .DESCRIPTION
        Get Country code from the string. However, The string can be either Address Line or full country name.

    .PARAMETER AddressLine*
        Required. Either can be full address or Full country name.

    .OUTPUTS
        Return the Country Code

    .EXAMPLE
        Get-CountryCode -Value "J2ML Infotech Pvt. Ltd., Ahmedabad, Gujarat, India"
#>

function Get-CountryCode() {	
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Value
    )
    Begin {
        $result = '';
    }
    Process {
        try {
            Switch -regex ($Value) {
                "Andorra$" { $result = 'AD'; Break; }
                "United Arab Emirates$" { $result = 'AE'; Break; }
                "Afghanistan$" { $result = 'AF'; Break; }
                "Antigua and Barbuda$" { $result = 'AG'; Break; }
                "Anguilla$" { $result = 'AI'; Break; }
                "Albania$" { $result = 'AL'; Break; }
                "Armenia$" { $result = 'AM'; Break; }
                "Netherlands Antilles$" { $result = 'AN'; Break; }
                "Angola$" { $result = 'AO'; Break; }
                "Antarctica$" { $result = 'AQ'; Break; }
                "Argentina$" { $result = 'AR'; Break; }
                "American Samoa$" { $result = 'AS'; Break; }
                "Austria$" { $result = 'AT'; Break; }
                "Australia$" { $result = 'AU'; Break; }
                "Aruba$" { $result = 'AW'; Break; }
                "Aland Islands$" { $result = 'AX'; Break; }
                "Azerbaijan$" { $result = 'AZ'; Break; }
                "Bosnia and Herzegovina$" { $result = 'BA'; Break; }
                "Barbados$" { $result = 'BB'; Break; }
                "Bangladesh$" { $result = 'BD'; Break; }
                "Belgium$" { $result = 'BE'; Break; }
                "Burkina Faso$" { $result = 'BF'; Break; }
                "Bulgaria$" { $result = 'BG'; Break; }
                "Bahrain$" { $result = 'BH'; Break; }
                "Burundi$" { $result = 'BI'; Break; }
                "Benin$" { $result = 'BJ'; Break; }
                "Bermuda$" { $result = 'BM'; Break; }
                "Brunei Darussalam$" { $result = 'BN'; Break; }
                "Bolivia$" { $result = 'BO'; Break; }
                "Brazil$" { $result = 'BR'; Break; }
                "Bahamas$" { $result = 'BS'; Break; }
                "Bhutan$" { $result = 'BT'; Break; }
                "Bouvet Island$" { $result = 'BV'; Break; }
                "Botswana$" { $result = 'BW'; Break; }
                "Belarus$" { $result = 'BY'; Break; }
                "Belize$" { $result = 'BZ'; Break; }
                "Canada$" { $result = 'CA'; Break; }
                "Cocos (Keeling) Islands$" { $result = 'CC'; Break; }
                "Democratic Republic of the Congo$" { $result = 'CD'; Break; }
                "Central African Republic$" { $result = 'CF'; Break; }
                "Congo$" { $result = 'CG'; Break; }
                "Switzerland$" { $result = 'CH'; Break; }
                "Cote D'Ivoire (Ivory Coast)$" { $result = 'CI'; Break; }
                "Cook Islands$" { $result = 'CK'; Break; }
                "Chile$" { $result = 'CL'; Break; }
                "Cameroon$" { $result = 'CM'; Break; }
                "China$" { $result = 'CN'; Break; }
                "Colombia$" { $result = 'CO'; Break; }
                "Costa Rica$" { $result = 'CR'; Break; }
                "Serbia and Montenegro$" { $result = 'CS'; Break; }
                "\(*Cuba\)*$" { $result = 'CU'; Break; }
                "Cape Verde$" { $result = 'CV'; Break; }
                "Christmas Island$" { $result = 'CX'; Break; }
                "Cyprus$" { $result = 'CY'; Break; }
                "Czech Republic$" { $result = 'CZ'; Break; }
                "Germany$" { $result = 'DE'; Break; }
                "Djibouti$" { $result = 'DJ'; Break; }
                "Denmark$" { $result = 'DK'; Break; }
                "Dominica$" { $result = 'DM'; Break; }
                "Dominican Republic$" { $result = 'DO'; Break; }
                "Algeria$" { $result = 'DZ'; Break; }
                "Ecuador$" { $result = 'EC'; Break; }
                "Estonia$" { $result = 'EE'; Break; }
                "Egypt$" { $result = 'EG'; Break; }
                "Western Sahara$" { $result = 'EH'; Break; }
                "Eritrea$" { $result = 'ER'; Break; }
                "Spain$" { $result = 'ES'; Break; }
                "Ethiopia$" { $result = 'ET'; Break; }
                "Finland$" { $result = 'FI'; Break; }
                "Fiji$" { $result = 'FJ'; Break; }
                "Falkland Islands (Malvinas)$" { $result = 'FK'; Break; }
                "Federated States of Micronesia$" { $result = 'FM'; Break; }
                "Faroe Islands$" { $result = 'FO'; Break; }
                "France$" { $result = 'FR'; Break; }
                "\(*France\)*$" { $result = 'FR'; Break; }
                "France, Metropolitan$" { $result = 'FX'; Break; }
                "Gabon$" { $result = 'GA'; Break; }
                "Great Britain (UK)$" { $result = 'GB'; Break; }
                "Grenada$" { $result = 'GD'; Break; }
                "Georgia$" { $result = 'GE'; Break; }
                "French Guiana$" { $result = 'GF'; Break; }
                "Ghana$" { $result = 'GH'; Break; }
                "Gibraltar$" { $result = 'GI'; Break; }
                "Greenland$" { $result = 'GL'; Break; }
                "Gambia$" { $result = 'GM'; Break; }
                "Guinea$" { $result = 'GN'; Break; }
                "Guadeloupe$" { $result = 'GP'; Break; }
                "Equatorial Guinea$" { $result = 'GQ'; Break; }
                "Greece$" { $result = 'GR'; Break; }
                "S. Georgia and S. Sandwich Islands$" { $result = 'GS'; Break; }
                "Guatemala$" { $result = 'GT'; Break; }
                "Guam$" { $result = 'GU'; Break; }
                "Guinea-Bissau$" { $result = 'GW'; Break; }
                "Guyana$" { $result = 'GY'; Break; }
                "Hong Kong$" { $result = 'HK'; Break; }
                "Heard Island and McDonald Islands$" { $result = 'HM'; Break; }
                "Honduras$" { $result = 'HN'; Break; }
                "Croatia (Hrvatska)$" { $result = 'HR'; Break; }
                "Haiti$" { $result = 'HT'; Break; }
                "Hungary$" { $result = 'HU'; Break; }
                "Indonesia$" { $result = 'ID'; Break; }
                "Ireland$" { $result = 'IE'; Break; }
                "Israel$" { $result = 'IL'; Break; }
                "India$" { $result = 'IN'; Break; }
                "British Indian Ocean Territory$" { $result = 'IO'; Break; }
                "Iraq$" { $result = 'IQ'; Break; }
                "Iran$" { $result = 'IR'; Break; }
                "Iceland$" { $result = 'IS'; Break; }
                "Italy$" { $result = 'IT'; Break; }
                "Jamaica$" { $result = 'JM'; Break; }
                "Jordan$" { $result = 'JO'; Break; }
                "Japan$" { $result = 'JP'; Break; }
                "Kenya$" { $result = 'KE'; Break; }
                "Kyrgyzstan$" { $result = 'KG'; Break; }
                "Cambodia$" { $result = 'KH'; Break; }
                "Kiribati$" { $result = 'KI'; Break; }
                "Comoros$" { $result = 'KM'; Break; }
                "Saint Kitts and Nevis$" { $result = 'KN'; Break; }
                "Korea (North)$" { $result = 'KP'; Break; }
                "Korea (South)$" { $result = 'KR'; Break; }
                "Republic Of Korea$" { $result = 'KR'; Break; }
                "Kuwait$" { $result = 'KW'; Break; }
                "Cayman Islands$" { $result = 'KY'; Break; }
                "Kazakhstan$" { $result = 'KZ'; Break; }
                "Laos$" { $result = 'LA'; Break; }
                "Lebanon$" { $result = 'LB'; Break; }
                "Saint Lucia$" { $result = 'LC'; Break; }
                "Liechtenstein$" { $result = 'LI'; Break; }
                "Sri Lanka$" { $result = 'LK'; Break; }
                "Liberia$" { $result = 'LR'; Break; }
                "Lesotho$" { $result = 'LS'; Break; }
                "Lithuania$" { $result = 'LT'; Break; }
                "Luxembourg$" { $result = 'LU'; Break; }
                "Latvia$" { $result = 'LV'; Break; }
                "Libya$" { $result = 'LY'; Break; }
                "Morocco$" { $result = 'MA'; Break; }
                "Monaco$" { $result = 'MC'; Break; }
                "Moldova$" { $result = 'MD'; Break; }
                "Madagascar$" { $result = 'MG'; Break; }
                "Marshall Islands$" { $result = 'MH'; Break; }
                "Macedonia$" { $result = 'MK'; Break; }
                "Mali$" { $result = 'ML'; Break; }
                "Myanmar$" { $result = 'MM'; Break; }
                "Mongolia$" { $result = 'MN'; Break; }
                "Macao$" { $result = 'MO'; Break; }
                "Northern Mariana Islands$" { $result = 'MP'; Break; }
                "Martinique$" { $result = 'MQ'; Break; }
                "Mauritania$" { $result = 'MR'; Break; }
                "Montserrat$" { $result = 'MS'; Break; }
                "Malta$" { $result = 'MT'; Break; }
                "Mauritius$" { $result = 'MU'; Break; }
                "Maldives$" { $result = 'MV'; Break; }
                "Malawi$" { $result = 'MW'; Break; }
                "Mexico$" { $result = 'MX'; Break; }
                "Malaysia$" { $result = 'MY'; Break; }
                "Mozambique$" { $result = 'MZ'; Break; }
                "Namibia$" { $result = 'NA'; Break; }
                "New Caledonia$" { $result = 'NC'; Break; }
                "Niger$" { $result = 'NE'; Break; }
                "Norfolk Island$" { $result = 'NF'; Break; }
                "Nigeria$" { $result = 'NG'; Break; }
                "Nicaragua$" { $result = 'NI'; Break; }
                "Netherlands$" { $result = 'NL'; Break; }
                "Norway$" { $result = 'NO'; Break; }
                "Nepal$" { $result = 'NP'; Break; }
                "Nauru$" { $result = 'NR'; Break; }
                "Niue$" { $result = 'NU'; Break; }
                "New Zealand$" { $result = 'NZ'; Break; }
                "Oman$" { $result = 'OM'; Break; }
                "Panama$" { $result = 'PA'; Break; }
                "Peru$" { $result = 'PE'; Break; }
                "French Polynesia$" { $result = 'PF'; Break; }
                "Papua New Guinea$" { $result = 'PG'; Break; }
                "Philippines$" { $result = 'PH'; Break; }
                "Pakistan$" { $result = 'PK'; Break; }
                "Poland$" { $result = 'PL'; Break; }
                "Saint Pierre and Miquelon$" { $result = 'PM'; Break; }
                "Pitcairn$" { $result = 'PN'; Break; }
                "Puerto Rico$" { $result = 'PR'; Break; }
                "Palestinian Territory$" { $result = 'PS'; Break; }
                "Portugal$" { $result = 'PT'; Break; }
                "Palau$" { $result = 'PW'; Break; }
                "Paraguay$" { $result = 'PY'; Break; }
                "Qatar$" { $result = 'QA'; Break; }
                "Reunion$" { $result = 'RE'; Break; }
                "Romania$" { $result = 'RO'; Break; }
                "Russian Federation$" { $result = 'RU'; Break; }
                "Rwanda$" { $result = 'RW'; Break; }
                "Saudi Arabia$" { $result = 'SA'; Break; }
                "Solomon Islands$" { $result = 'SB'; Break; }
                "Seychelles$" { $result = 'SC'; Break; }
                "Sudan$" { $result = 'SD'; Break; }
                "Sweden$" { $result = 'SE'; Break; }
                "Singapore$" { $result = 'SG'; Break; }
                "Saint Helena$" { $result = 'SH'; Break; }
                "Slovenia$" { $result = 'SI'; Break; }
                "Svalbard and Jan Mayen$" { $result = 'SJ'; Break; }
                "Slovakia$" { $result = 'SK'; Break; }
                "Sierra Leone$" { $result = 'SL'; Break; }
                "San Marino$" { $result = 'SM'; Break; }
                "Senegal$" { $result = 'SN'; Break; }
                "Somalia$" { $result = 'SO'; Break; }
                "Suriname$" { $result = 'SR'; Break; }
                "Sao Tome and Principe$" { $result = 'ST'; Break; }
                "USSR (former)$" { $result = 'SU'; Break; }
                "El Salvador$" { $result = 'SV'; Break; }
                "Syria$" { $result = 'SY'; Break; }
                "Swaziland$" { $result = 'SZ'; Break; }
                "Turks and Caicos Islands$" { $result = 'TC'; Break; }
                "Chad$" { $result = 'TD'; Break; }
                "French Southern Territories$" { $result = 'TF'; Break; }
                "Togo$" { $result = 'TG'; Break; }
                "Thailand$" { $result = 'TH'; Break; }
                "Tajikistan$" { $result = 'TJ'; Break; }
                "Tokelau$" { $result = 'TK'; Break; }
                "Timor-Leste$" { $result = 'TL'; Break; }
                "Turkmenistan$" { $result = 'TM'; Break; }
                "Tunisia$" { $result = 'TN'; Break; }
                "Tonga$" { $result = 'TO'; Break; }
                "East Timor$" { $result = 'TP'; Break; }
                "Turkey$" { $result = 'TR'; Break; }
                "Trinidad and Tobago$" { $result = 'TT'; Break; }
                "Tuvalu$" { $result = 'TV'; Break; }
                "Taiwan$" { $result = 'TW'; Break; }
                "Tanzania$" { $result = 'TZ'; Break; }
                "Ukraine$" { $result = 'UA'; Break; }
                "Uganda$" { $result = 'UG'; Break; }
                "United Kingdom$" { $result = 'UK'; Break; }
                "United States Minor Outlying Islands$" { $result = 'UM'; Break; }
                "United States$" { $result = 'US'; Break; }
                "United States of America$" { $result = 'US'; Break; }
                "U\.S\.A$" { $result = 'US'; Break; }
                "Uruguay$" { $result = 'UY'; Break; }
                "Uzbekistan$" { $result = 'UZ'; Break; }
                "Vatican City State (Holy See)$" { $result = 'VA'; Break; }
                "Saint Vincent and the Grenadines$" { $result = 'VC'; Break; }
                "Venezuela$" { $result = 'VE'; Break; }
                "Virgin Islands (British)$" { $result = 'VG'; Break; }
                "Virgin Islands (U.S.)$" { $result = 'VI'; Break; }
                "Viet Nam$" { $result = 'VN'; Break; }
                "Vanuatu$" { $result = 'VU'; Break; }
                "Wallis and Futuna$" { $result = 'WF'; Break; }
                "Samoa$" { $result = 'WS'; Break; }
                "Yemen$" { $result = 'YE'; Break; }
                "Mayotte$" { $result = 'YT'; Break; }
                "Yugoslavia (former)$" { $result = 'YU'; Break; }
                "South Africa$" { $result = 'ZA'; Break; }
                "Zambia$" { $result = 'ZM'; Break; }
                "Zaire (former)$" { $result = 'ZR'; Break; }
                "Zimbabwe$" { $result = 'ZW'; Break; }
                Default { $result = ''; Break; }
            }
            return $result
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-CountryCode'" -Stop $true
        }
        finally { }
    }
    End {
    }
}