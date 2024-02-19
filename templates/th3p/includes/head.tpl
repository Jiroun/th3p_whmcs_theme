<!-- Styling -->
{if $language eq 'arabic'} 
<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;400;500;600;900&family=Noto+Kufi+Arabic:wght@200;300;400&display=swap" rel="stylesheet"> -->
{else}
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
{/if}











<link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">




{if $language eq 'arabic'} 
<link href="{assetPath file='theme.min.ar.css'}?v={$versionHash}" rel="stylesheet">
{else}
<link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
{/if}






{* <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet"> *}

<script type="text/javascript">
	(function() {
		var css = document.createElement('link');
		css.href = '{$WEB_ROOT}/assets/css/fontawesome-all.min.css';
		css.rel = 'stylesheet';
		css.type = 'text/css';
		document.getElementsByTagName('head')[0].appendChild(css);
	})();
</script>


{if $language eq 'arabic'} 

{assetExists file="custom.ar.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}


{else}

{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

{/if}


{assetExists file="custom.alllang.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang|addslashes key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>



{* <script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script> *}

<script SYNC src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

{* <script SYNC src="{assetPath file='custom.js'}"></script> *}


{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}