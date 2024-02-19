<?php



use WHMCS\Database\Capsule;



// الصفحة الرئيسية
// عنوان ووصف ورابط اساسي
// التايتل يبقى تعديله من ملف الهيدر في الثيم
add_hook('ClientAreaPage', 1, function($vars) {
   
   
       
    GLOBAL $smarty;
    
    $templatefile = $smarty->getVariable('templatefile');
    $language = $vars['activeLocale']['locale'];
    
    if ($templatefile == "homepage")
    {
    if ($language == "ar_AR" )
    {

        add_hook('ClientAreaHeadOutput', 1, function($vars) {
            
            $title = "المزود | مزود خدمة الإستضافة - سيرفرات - خدمات برمجية وغيرها";
            
    return <<<HTML
    <link rel="canonical" href="https://th3p.com" />
    <meta name="description" content="موقع المزود TH3Provider - أفضل مزود لخدمات الاستضافة - حجز نطاقات - سيرفرات لينكس - سيرفرات ويندوز والخدمات البرمجية وغيرها">
    <meta name="keywords" content="الاستضافة المشتركة,استضافة المزود,المزود,حجز نطاقات,th3p,Provider,TH3Provider,سيرفرات لينكس,سيرفرات ويندوز,شحن أرصدة الجوالات,بطاقات الألعاب,منتجات مايكروسوفت,خدمات الفي بي ان,شدات ببجي موبايل,مزود,خدمات برمجية">
    <meta property="og:description" content="موقع المزود TH3Provider - أفضل مزود لخدمات الاستضافة - حجز نطاقات - سيرفرات لينكس - سيرفرات ويندوز والخدمات البرمجية وغيرها">
    <meta name="twitter:description" content="موقع المزود TH3Provider - أفضل مزود لخدمات الاستضافة - حجز نطاقات - سيرفرات لينكس - سيرفرات ويندوز والخدمات البرمجية وغيرها">
    <meta name="twitter:title" content="{$title}"/>
    <meta property="og:title" content="{$title}">
HTML;
});



    }
    
    if ($language == "en_GB")
    {
        
        add_hook('ClientAreaHeadOutput', 1, function($vars) {
            
             $title = "TH3Provider | Hosting, VPS, Dedicated Server, and more services";
             
    return <<<HTML
    <link rel="canonical" href="https://th3p.com/?language=english" />
    <meta name="description" content="TH3P (TH3Provider) The Best Provider for Buy Domain - cPanel Hosting - Windows Servers - Linux Dedicated Servers - Linux VPS Servers - Games Gift Cards - iTunes & Google Play Cards - Shopping Gift Cards, Programming Services and more">
    <meta name="keywords" content="TH3Provider,Domains,cPanel Hosting,Shopping Cards,Google Play Cards,iTunes Cards, Liniux VPS Servers,Windows Servers,Game Gift Cards,Windows Servers,Mobile Recharge,Programming Services">
    <meta property="og:description" content="TH3P (TH3Provider) The Best Provider for Buy Domain - cPanel Hosting - Windows Servers - Linux Dedicated Servers - Linux VPS Servers - Games Gift Cards - iTunes & Google Play Cards - Shopping Gift Cards, Programming Services and more">
    <meta name="twitter:description" content="TH3P (TH3Provider) The Best Provider for Buy Domain - cPanel Hosting - Windows Servers - Linux Dedicated Servers - Linux VPS Servers - Games Gift Cards - iTunes & Google Play Cards - Shopping Gift Cards, Programming Servicess and more">
    <meta name="twitter:title" content="{$title}"/>
    <meta property="og:title" content="{$title}">
HTML;
});
    }
    
    
    } // end of (if homepage)
   
});


// زر تبديل اللغة
add_hook('ClientAreaPage', 1, function($vars) {
    
    $currentpagelinkback =$vars['currentpagelinkback'];
    if (substr($currentpagelinkback, -1) == '?')
    {
        $currentpagelinkback = $currentpagelinkback;
    }
    elseif (substr($currentpagelinkback, -1) == '&')
    {
        $currentpagelinkback = $currentpagelinkback;
    }
    else
    {
        $currentpagelinkback.="&";
    }
    
    
    
    return array("footerurl"  => $currentpagelinkback );
    




});




// تحسين شكل اختيار الدومين بالعربي

add_hook('ClientAreaPageCart', 1, function($vars) {
    
    $language = $vars['activeLocale']['locale'];
    GLOBAL $smarty;
    
    $templatefile = $smarty->getVariable('templatefile');

    if ($templatefile == "configureproductdomain" && $language == "ar_AR") {
            {
        add_hook('ClientAreaFooterOutput', 1, function($vars) {
            
        $return = '
    <script>
var elements = document.getElementsByClassName("input-group-text");
for (var i = 0; i < elements.length; i++) {
  elements[i].style.cssText = "border: 1px solid #ced4da;border-radius: .25rem;border-top-right-radius: 0;border-bottom-right-radius: 0;"
}
</script>
    ';
        return $return;
        }); 
    }
    
    
    }
});


// عناوين الاقسام
add_hook('ClientAreaPage', 1, function($vars) {
    
    $template = $vars['carttpl'];
    
    if ($template=="standard_cart")
    
    {

    
        if ($vars['productgroups']){
                    for ($i = 0; $i < count($vars['productgroups']); $i++) {
                    if ($vars['productgroups'][$i]['gid'] == $vars['gid'])
                    return array("pagetitle" => $vars['groupname'], "companyname" =>getsitename($vars));} 
        }
    
         
    }
    
    
    });



