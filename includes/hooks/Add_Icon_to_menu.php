<?php

use WHMCS\View\Menu\Item as MenuItem;
use WHMCS\Database\Capsule;

$sections = [
    [
        'nameAr' => 'الإستضافة المشتركة',
        'nameEn' => 'Shared Hosting',
        'icon' => 'fas fa-cloud',
    ],
    [
        'nameAr' => 'بطاقات PlayStation Store',
        'nameEn' => 'PlayStation Store Cards',
        'icon' => 'fab fa-playstation',
    ],
    [
        'nameAr' => 'برامج مضادات الفيروسات',
        'nameEn' => 'Antivirus Programs',
        'icon' => 'fas fa-shield-check',
    ],
    [
        'nameAr' => 'السيرفرات الافتراضية الخاصة',
        'nameEn' => 'Linux VPS Servers',
        'icon' => 'fad fa-server',
    ],
    [
        'nameAr' => 'السيرفرات الكاملة المخصصة',
        'nameEn' => 'Linux Dedicated Servers',
        'icon' => 'fad fa-server',
    ],
    [
        'nameAr' => 'سيرفرات الويندوز',
        'nameEn' => 'Windows Servers',
        'icon' => 'fad fa-server',
    ],
    [
        'nameAr' => 'شحن أرصدة الجوالات',
        'nameEn' => 'MOBILE RECHARGE',
        'icon' => 'fas fa-mobile-alt',
    ],
    [
        'nameAr' => 'بطاقات الألعاب',
        'nameEn' => 'Games Gift Cards',
        'icon' => 'fad fa-gift-card',
    ],
    [
        'nameAr' => 'شدات ببجي موبايل',
        'nameEn' => 'PUBG MOBILE UC',
        'icon' => 'far fa-credit-card-blank',
    ],
    [
        'nameAr' => 'بطاقات التسوق',
        'nameEn' => 'Shopping Gift Card',
        'icon' => 'fad fa-gift-card',
    ],
    [
        'nameAr' => 'بطاقات Google Play',
        'nameEn' => 'Google Play Cards',
        'icon' => 'fab fa-google-play',
    ],
    [
        'nameAr' => 'بطاقات آيتونز',
        'nameEn' => 'iTunes Gift Cards',
        'icon' => 'fab fa-app-store-ios',
    ],
    [
        'nameAr' => 'منتجات مايكروسوفت',
        'nameEn' => 'Microsoft products',
        'icon' => 'fab fa-microsoft',
    ],
    [
        'nameAr' => 'خدمات الفي بي ان',
        'nameEn' => 'VPN services',
        'icon' => 'fas fa-shield-alt',
    ],
    [
        'nameAr' => 'الخدمات البرمجية',
        'nameEn' => 'Programming Services',
        'icon' => 'fas fa-code',
    ]
];


$basicItems = [
    'Home' => 'fas fa-home-lg-alt',
    'Services' => 'fas fa-cube',
    'Domains' => 'fas fa-globe',
    'Billing' => 'fas fa-credit-card',
    'Support' => 'far fa-life-ring',
    'Open Ticket' => 'fas fa-ticket-alt',
    'Store' => 'fas fa-store-alt',
    'Announcements' => 'far fa-newspaper',
    'Knowledgebase' => 'fas fa-info-circle',
    'Network Status' => 'fas fa-rocket',
    'Affiliates' => 'fas fa-users',
    'Contact Us' => 'fas fa-envelope',
];


function CheckNestedGetChild(object $obj, array $Names) {
    foreach ($Names as $Name) {
        if (!is_null($obj->getChild($Name))) {
            $obj = $obj->getChild($Name);
        } else {
            return null;
        }
    }
    return $obj;
}


add_hook('ClientAreaPrimaryNavbar', 1, function (MenuItem $primaryNavbar) use ($sections, $basicItems) {
    // تعيين الأيقونات للعناصر الأساسية
    foreach ($basicItems as $itemName => $icon) {
        if (!is_null($primaryNavbar->getChild($itemName))) {
            $primaryNavbar->getChild($itemName)->setIcon($icon);
        }
    }

    // تعيين الأيقونات للأقسام داخل "Store"
    $store = $primaryNavbar->getChild('Store');
    if (!is_null($store)) {
        foreach ($sections as $section) {
            foreach (['nameAr', 'nameEn'] as $nameKey) {
                $child = $store->getChild($section[$nameKey]);
                if (!is_null($child)) {
                    $child->setIcon($section['icon']);
                    break; // توقف إذا تم تعيين الأيقونة بنجاح لأحد الأسماء
                }
            }
        }

        // تعيين الأيقونات لعناصر خاصة داخل "Store"
        if (!is_null($store->getChild('Register a New Domain'))) {
            $store->getChild('Register a New Domain')->setIcon('fas fa-globe');
        }
        if (!is_null($store->getChild('Transfer a Domain to Us'))) {
            $store->getChild('Transfer a Domain to Us')->setIcon('fas fa-share');
        }
    }
});


add_hook('ClientAreaSecondarySidebar', 1, function($secondarySidebar) use ($sections) {
    $categories = $secondarySidebar->getChild('Categories');
    if (!is_null($categories)) {
        foreach ($sections as $section) {
            // تحقق من وجود القسم باللغة الإنجليزية والعربية وتعيين الأيقونة
            foreach (['nameEn', 'nameAr'] as $nameKey) {
                $child = $categories->getChild($section[$nameKey]);
                if (!is_null($child)) {
                    $child->setIcon($section['icon']);
                    break;
                }
            }
        }
    }
});


add_hook('ClientAreaSecondaryNavbar', 1, function (MenuItem $secondaryNavbar)
{
   if (!is_null($secondaryNavbar->getChild('Account'))) {
           $secondaryNavbar->getChild('Account')->setIcon('fas fa-user-circle');
   }
   
//       if (!is_null($secondaryNavbar->getChild('Account')->getChild('Login'))) {
//           $secondaryNavbar->getChild('Account')->getChild('Login')
//                           ->setIcon('fas fa-sign-in-alt');
//   }

    $login = CheckNestedGetChild($secondaryNavbar, ['Account', 'Login']);
    if (!is_null($login)) {
        $login->setIcon('fas fa-sign-in-alt');
    }
    
    
//          if (!is_null($secondaryNavbar->getChild('Account')->getChild('Register'))) {
//           $secondaryNavbar->getChild('Account')->getChild('Register')
//                           ->setIcon('fas fa-user-plus');
//   }

    $Register = CheckNestedGetChild($secondaryNavbar, ['Account', 'Register']);
    if (!is_null($Register)) {
        $Register->setIcon('fas fa-user-plus');
    }
   
});




// ازالة الموقع والأمان بعد تفعيل شهادات ال اس اس ال



add_hook('ClientAreaPrimaryNavbar', 1, function (MenuItem $primaryNavbar)
{
	if (!is_null($primaryNavbar->getChild('Website Security'))) {
            $primaryNavbar->removeChild('Website Security');
	}
});




add_hook('ClientAreaSecondaryNavbar', 1, function (MenuItem $secondaryNavbar)
{

    $systemUrl = Capsule::table('tblconfiguration')->where('setting', 'SystemURL')->value('value');
    $login = CheckNestedGetChild($secondaryNavbar, ['Account', 'Login']);
    if (!is_null($login)) {
        $login->setUri($systemUrl.'login');
    }
});







