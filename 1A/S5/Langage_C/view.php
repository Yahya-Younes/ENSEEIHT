<!DOCTYPE html>
<html  dir="ltr" lang="fr" xml:lang="fr">
<head>
    <title>LangageC: Sujet pour les séances 1, 2 et 3 du Semestre 5</title>
    <link rel="icon" href="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/theme/1634298610/favicon" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="moodle, LangageC: Sujet pour les séances 1, 2 et 3 du Semestre 5" />
<link rel="stylesheet" type="text/css" href="https://moodle-n7.inp-toulouse.fr/theme/yui_combo.php?rollup/3.17.2/yui-moodlesimple-min.css" /><script id="firstthemesheet" type="text/css">/** Required in order to fix style inclusion problems in IE with YUI **/</script><link rel="stylesheet" type="text/css" href="https://moodle-n7.inp-toulouse.fr/theme/styles.php/adaptable/1634298610_1/all" />
<script>
//<![CDATA[
var M = {}; M.yui = {};
M.pageloadstarttime = new Date();
M.cfg = {"wwwroot":"https:\/\/moodle-n7.inp-toulouse.fr","sesskey":"RRoZ7cLYv6","sessiontimeout":"14400","themerev":"1634298610","slasharguments":1,"theme":"adaptable","iconsystemmodule":"core\/icon_system_fontawesome","jsrev":"1633340554","admin":"admin","svgicons":true,"usertimezone":"Europe\/Paris","contextid":83797,"langrev":1636514121,"templaterev":"1633340554"};var yui1ConfigFn = function(me) {if(/-skin|reset|fonts|grids|base/.test(me.name)){me.type='css';me.path=me.path.replace(/\.js/,'.css');me.path=me.path.replace(/\/yui2-skin/,'/assets/skins/sam/yui2-skin')}};
var yui2ConfigFn = function(me) {var parts=me.name.replace(/^moodle-/,'').split('-'),component=parts.shift(),module=parts[0],min='-min';if(/-(skin|core)$/.test(me.name)){parts.pop();me.type='css';min=''}
if(module){var filename=parts.join('-');me.path=component+'/'+module+'/'+filename+min+'.'+me.type}else{me.path=component+'/'+component+'.'+me.type}};
YUI_config = {"debug":false,"base":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/yuilib\/3.17.2\/","comboBase":"https:\/\/moodle-n7.inp-toulouse.fr\/theme\/yui_combo.php?","combine":true,"filter":null,"insertBefore":"firstthemesheet","groups":{"yui2":{"base":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/yuilib\/2in3\/2.9.0\/build\/","comboBase":"https:\/\/moodle-n7.inp-toulouse.fr\/theme\/yui_combo.php?","combine":true,"ext":false,"root":"2in3\/2.9.0\/build\/","patterns":{"yui2-":{"group":"yui2","configFn":yui1ConfigFn}}},"moodle":{"name":"moodle","base":"https:\/\/moodle-n7.inp-toulouse.fr\/theme\/yui_combo.php?m\/1633340554\/","combine":true,"comboBase":"https:\/\/moodle-n7.inp-toulouse.fr\/theme\/yui_combo.php?","ext":false,"root":"m\/1633340554\/","patterns":{"moodle-":{"group":"moodle","configFn":yui2ConfigFn}},"filter":null,"modules":{"moodle-core-formchangechecker":{"requires":["base","event-focus","moodle-core-event"]},"moodle-core-lockscroll":{"requires":["plugin","base-build"]},"moodle-core-actionmenu":{"requires":["base","event","node-event-simulate"]},"moodle-core-languninstallconfirm":{"requires":["base","node","moodle-core-notification-confirm","moodle-core-notification-alert"]},"moodle-core-chooserdialogue":{"requires":["base","panel","moodle-core-notification"]},"moodle-core-popuphelp":{"requires":["moodle-core-tooltip"]},"moodle-core-tooltip":{"requires":["base","node","io-base","moodle-core-notification-dialogue","json-parse","widget-position","widget-position-align","event-outside","cache-base"]},"moodle-core-blocks":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification"]},"moodle-core-notification":{"requires":["moodle-core-notification-dialogue","moodle-core-notification-alert","moodle-core-notification-confirm","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-core-notification-dialogue":{"requires":["base","node","panel","escape","event-key","dd-plugin","moodle-core-widget-focusafterclose","moodle-core-lockscroll"]},"moodle-core-notification-alert":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-confirm":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-exception":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-notification-ajaxexception":{"requires":["moodle-core-notification-dialogue"]},"moodle-core-dragdrop":{"requires":["base","node","io","dom","dd","event-key","event-focus","moodle-core-notification"]},"moodle-core-event":{"requires":["event-custom"]},"moodle-core-handlebars":{"condition":{"trigger":"handlebars","when":"after"}},"moodle-core-maintenancemodetimer":{"requires":["base","node"]},"moodle-core_availability-form":{"requires":["base","node","event","event-delegate","panel","moodle-core-notification-dialogue","json"]},"moodle-backup-confirmcancel":{"requires":["node","node-event-simulate","moodle-core-notification-confirm"]},"moodle-backup-backupselectall":{"requires":["node","event","node-event-simulate","anim"]},"moodle-course-management":{"requires":["base","node","io-base","moodle-core-notification-exception","json-parse","dd-constrain","dd-proxy","dd-drop","dd-delegate","node-event-delegate"]},"moodle-course-categoryexpander":{"requires":["node","event-key"]},"moodle-course-formatchooser":{"requires":["base","node","node-event-simulate"]},"moodle-course-dragdrop":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification","moodle-course-coursebase","moodle-course-util"]},"moodle-course-util":{"requires":["node"],"use":["moodle-course-util-base"],"submodules":{"moodle-course-util-base":{},"moodle-course-util-section":{"requires":["node","moodle-course-util-base"]},"moodle-course-util-cm":{"requires":["node","moodle-course-util-base"]}}},"moodle-form-shortforms":{"requires":["node","base","selector-css3","moodle-core-event"]},"moodle-form-passwordunmask":{"requires":[]},"moodle-form-dateselector":{"requires":["base","node","overlay","calendar"]},"moodle-question-preview":{"requires":["base","dom","event-delegate","event-key","core_question_engine"]},"moodle-question-searchform":{"requires":["base","node"]},"moodle-question-chooser":{"requires":["moodle-core-chooserdialogue"]},"moodle-availability_completion-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_date-form":{"requires":["base","node","event","io","moodle-core_availability-form"]},"moodle-availability_grade-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_group-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_grouping-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-availability_profile-form":{"requires":["base","node","event","moodle-core_availability-form"]},"moodle-mod_assign-history":{"requires":["node","transition"]},"moodle-mod_bigbluebuttonbn-broker":{"requires":["base","node","datasource-get","datasource-jsonschema","datasource-polling","moodle-core-notification"]},"moodle-mod_bigbluebuttonbn-recordings":{"requires":["base","node","datasource-get","datasource-jsonschema","datasource-polling","moodle-core-notification"]},"moodle-mod_bigbluebuttonbn-imports":{"requires":["base","node"]},"moodle-mod_bigbluebuttonbn-modform":{"requires":["base","node"]},"moodle-mod_bigbluebuttonbn-rooms":{"requires":["base","node","datasource-get","datasource-jsonschema","datasource-polling","moodle-core-notification"]},"moodle-mod_checklist-linkselect":{"requires":["node","event-valuechange"]},"moodle-mod_quiz-quizbase":{"requires":["base","node"]},"moodle-mod_quiz-autosave":{"requires":["base","node","event","event-valuechange","node-event-delegate","io-form"]},"moodle-mod_quiz-modform":{"requires":["base","node","event"]},"moodle-mod_quiz-dragdrop":{"requires":["base","node","io","dom","dd","dd-scroll","moodle-core-dragdrop","moodle-core-notification","moodle-mod_quiz-quizbase","moodle-mod_quiz-util-base","moodle-mod_quiz-util-page","moodle-mod_quiz-util-slot","moodle-course-util"]},"moodle-mod_quiz-toolboxes":{"requires":["base","node","event","event-key","io","moodle-mod_quiz-quizbase","moodle-mod_quiz-util-slot","moodle-core-notification-ajaxexception"]},"moodle-mod_quiz-util":{"requires":["node","moodle-core-actionmenu"],"use":["moodle-mod_quiz-util-base"],"submodules":{"moodle-mod_quiz-util-base":{},"moodle-mod_quiz-util-slot":{"requires":["node","moodle-mod_quiz-util-base"]},"moodle-mod_quiz-util-page":{"requires":["node","moodle-mod_quiz-util-base"]}}},"moodle-mod_quiz-questionchooser":{"requires":["moodle-core-chooserdialogue","moodle-mod_quiz-util","querystring-parse"]},"moodle-message_airnotifier-toolboxes":{"requires":["base","node","io"]},"moodle-filter_glossary-autolinker":{"requires":["base","node","io-base","json-parse","event-delegate","overlay","moodle-core-event","moodle-core-notification-alert","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-filter_mathjaxloader-loader":{"requires":["moodle-core-event"]},"moodle-editor_atto-rangy":{"requires":[]},"moodle-editor_atto-editor":{"requires":["node","transition","io","overlay","escape","event","event-simulate","event-custom","node-event-html5","node-event-simulate","yui-throttle","moodle-core-notification-dialogue","moodle-core-notification-confirm","moodle-editor_atto-rangy","handlebars","timers","querystring-stringify"]},"moodle-editor_atto-plugin":{"requires":["node","base","escape","event","event-outside","handlebars","event-custom","timers","moodle-editor_atto-menu"]},"moodle-editor_atto-menu":{"requires":["moodle-core-notification-dialogue","node","event","event-custom"]},"moodle-report_eventlist-eventfilter":{"requires":["base","event","node","node-event-delegate","datatable","autocomplete","autocomplete-filters"]},"moodle-report_loglive-fetchlogs":{"requires":["base","event","node","io","node-event-delegate"]},"moodle-gradereport_grader-gradereporttable":{"requires":["base","node","event","handlebars","overlay","event-hover"]},"moodle-gradereport_history-userselector":{"requires":["escape","event-delegate","event-key","handlebars","io-base","json-parse","moodle-core-notification-dialogue"]},"moodle-tool_capability-search":{"requires":["base","node"]},"moodle-tool_lp-dragdrop-reorder":{"requires":["moodle-core-dragdrop"]},"moodle-tool_monitor-dropdown":{"requires":["base","event","node"]},"moodle-assignfeedback_editpdf-editor":{"requires":["base","event","node","io","graphics","json","event-move","event-resize","transition","querystring-stringify-simple","moodle-core-notification-dialog","moodle-core-notification-alert","moodle-core-notification-warning","moodle-core-notification-exception","moodle-core-notification-ajaxexception"]},"moodle-atto_accessibilitychecker-button":{"requires":["color-base","moodle-editor_atto-plugin"]},"moodle-atto_accessibilityhelper-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_align-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_bold-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_charmap-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_clear-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_collapse-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_emojipicker-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_emoticon-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_equation-button":{"requires":["moodle-editor_atto-plugin","moodle-core-event","io","event-valuechange","tabview","array-extras"]},"moodle-atto_h5p-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_html-button":{"requires":["promise","moodle-editor_atto-plugin","moodle-atto_html-beautify","moodle-atto_html-codemirror","event-valuechange"]},"moodle-atto_html-beautify":{},"moodle-atto_html-codemirror":{"requires":["moodle-atto_html-codemirror-skin"]},"moodle-atto_image-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_indent-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_italic-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_link-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_managefiles-usedfiles":{"requires":["node","escape"]},"moodle-atto_managefiles-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_media-button":{"requires":["moodle-editor_atto-plugin","moodle-form-shortforms"]},"moodle-atto_noautolink-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_orderedlist-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_recordrtc-recording":{"requires":["moodle-atto_recordrtc-button"]},"moodle-atto_recordrtc-button":{"requires":["moodle-editor_atto-plugin","moodle-atto_recordrtc-recording"]},"moodle-atto_rtl-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_strike-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_subscript-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_superscript-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_table-button":{"requires":["moodle-editor_atto-plugin","moodle-editor_atto-menu","event","event-valuechange"]},"moodle-atto_title-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_underline-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_undo-button":{"requires":["moodle-editor_atto-plugin"]},"moodle-atto_unorderedlist-button":{"requires":["moodle-editor_atto-plugin"]}}},"gallery":{"name":"gallery","base":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/yuilib\/gallery\/","combine":true,"comboBase":"https:\/\/moodle-n7.inp-toulouse.fr\/theme\/yui_combo.php?","ext":false,"root":"gallery\/1633340554\/","patterns":{"gallery-":{"group":"gallery"}}}},"modules":{"core_filepicker":{"name":"core_filepicker","fullpath":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/javascript.php\/1633340554\/repository\/filepicker.js","requires":["base","node","node-event-simulate","json","async-queue","io-base","io-upload-iframe","io-form","yui2-treeview","panel","cookie","datatable","datatable-sort","resize-plugin","dd-plugin","escape","moodle-core_filepicker","moodle-core-notification-dialogue"]},"core_comment":{"name":"core_comment","fullpath":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/javascript.php\/1633340554\/comment\/comment.js","requires":["base","io-base","node","json","yui2-animation","overlay","escape"]},"mathjax":{"name":"mathjax","fullpath":"https:\/\/cdn.jsdelivr.net\/npm\/mathjax@2.7.8\/MathJax.js?delayStartupUntil=configured"}}};
M.yui.loader = {modules: {}};

//]]>
</script>
    <!-- CSS print media -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Twitter Card data -->
    <meta name="twitter:card" value="summary">
    <meta name="twitter:site" value="Moodle N7" />
    <meta name="twitter:title" value="LangageC: Sujet pour les séances 1, 2 et 3 du Semestre 5" />

    <!-- Open Graph data -->
    <meta property="og:title" content="LangageC: Sujet pour les séances 1, 2 et 3 du Semestre 5" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="" />
    <meta name="og:site_name" value="Moodle N7" />

    <!-- Chrome, Firefox OS and Opera on Android topbar color -->
    <meta name="theme-color" content="#2871FA" />

    <!-- Windows Phone topbar color -->
    <meta name="msapplication-navbutton-color" content="#2871FA" />

    <!-- iOS Safari topbar color -->
    <meta name="apple-mobile-web-app-status-bar-style" content="#2871FA" />

    <!-- Load Google Fonts --><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i" rel="stylesheet" type="text/css"><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i" rel="stylesheet" type="text/css"><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i" rel="stylesheet" type="text/css"></head>
<body  id="page-mod-folder-view" class="format-tiles loginfailures  path-mod path-mod-folder gecko dir-ltr lang-fr yui-skin-sam yui3-skin-sam moodle-n7-inp-toulouse-fr pagelayout-incourse course-1353 context-83797 cmid-49188 category-395 theme_adaptable two-column  header-style1 has-page-header  nomobilenavigation">

<div>
    <a class="sr-only sr-only-focusable" href="#maincontent">Passer au contenu principal</a>
</div><script src="https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/babel-polyfill/polyfill.min.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/polyfills/polyfill.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/yui_combo.php?rollup/3.17.2/yui-moodlesimple-min.js"></script><script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/core/jquery-3.5.1.min.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/theme_adaptable/pace-min.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/theme_adaptable/jquery-flexslider-min.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/theme_adaptable/tickerme.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/theme_adaptable/jquery-easing-min.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/theme/jquery.php/theme_adaptable/adaptable_v2_1_1_2.js"></script>
<script src="https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/javascript-static.js"></script>
<script>
//<![CDATA[
document.body.className += ' jsenabled';
//]]>
</script>


<div id="page-wrapper">
    <div id="page" class="fullin showblockicons standard">
    <header id="adaptable-page-header-wrapper">
    <div id="above-header">
        <div class="container">
            <nav class="navbar navbar-expand btco-hover-menu">
                <div id="adaptable-page-header-nav-drawer" data-region="drawer-toggle" class="d-lg-none mr-3">
                    <button id="drawer" aria-expanded="false" aria-controls="nav-drawer" type="button" class="nav-link float-sm-left mr-1" data-side="left">
                        <i class="fa fa-bars fa-fw" aria-hidden="true"></i>
                        <span class="sr-only">Panneau latéral</span>
                    </button>
                </div>

                <div class="collapse navbar-collapse">
                <div class="my-auto m-1"></div>
                    <ul class="navbar-nav ml-auto my-auto">
                        <li class="pull-left">
                            <ul class="navbar-nav mr-auto"></ul>
                        </li>


                        <li class="nav-item mx-md-1 my-auto d-xs-block d-sm-block d-md-none my-auto">
                            <a class="nav-link" href="https://moodle-n7.inp-toulouse.fr/course/search.php">
                                <i class="icon fa fa-search fa-fw " title="Search" aria-label="Search"></i>
                            </a>
                        </li>

                        <li class="my-auto mx-md-1"><div class="popover-region collapsed popover-region-notifications"
    id="nav-notification-popover-container" data-userid="11025"
    data-region="popover-region">
    <div class="popover-region-toggle nav-link"
        data-region="popover-region-toggle"
        role="button"
        aria-controls="popover-region-container-618b70a0b5b4c618b70a0b3c6d40"
        aria-haspopup="true"
        aria-label="Afficher la fenêtre des notifications sans nouvelle notification"
        tabindex="0">
                <i class="icon fa fa-bell fa-fw "  title="Ouvrir/fermer le menu notifications" aria-label="Ouvrir/fermer le menu notifications"></i>
        <div class="count-container hidden" data-region="count-container"
        aria-label="Il y a 0 notifications non lues">0</div>

    </div>
    <div 
        id="popover-region-container-618b70a0b5b4c618b70a0b3c6d40"
        class="popover-region-container"
        data-region="popover-region-container"
        aria-expanded="false"
        aria-hidden="true"
        aria-label="Fenêtre de notification"
        role="region">
        <div class="popover-region-header-container">
            <h3 class="popover-region-header-text" data-region="popover-region-header-text">Notifications</h3>
            <div class="popover-region-header-actions" data-region="popover-region-header-actions">        <a class="mark-all-read-button"
           href="#"
           title="Tout marquer comme lu"
           data-action="mark-all-read"
           role="button"
           aria-label="Tout marquer comme lu">
            <span class="normal-icon"><i class="icon fa fa-check fa-fw " aria-hidden="true"  ></i></span>
            <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
        </a>
        <a href="https://moodle-n7.inp-toulouse.fr/message/notificationpreferences.php?userid=11025"
           title="Préférences de notification"
           aria-label="Préférences de notification">
            <i class="icon fa fa-cog fa-fw " aria-hidden="true"  ></i>
        </a>
</div>
        </div>
        <div class="popover-region-content-container" data-region="popover-region-content-container">
            <div class="popover-region-content" data-region="popover-region-content">
                        <div class="all-notifications"
            data-region="all-notifications"
            role="log"
            aria-busy="false"
            aria-atomic="false"
            aria-relevant="additions"></div>
        <div class="empty-message" tabindex="0" data-region="empty-message">Vous n'avez pas de notification</div>

            </div>
            <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
        </div>
                <a class="see-all-link"
                    href="https://moodle-n7.inp-toulouse.fr/message/output/popup/notifications.php">
                    <div class="popover-region-footer-container">
                        <div class="popover-region-seeall-text">Tout afficher</div>
                    </div>
                </a>
    </div>
</div><div class="pull-right popover-region popover-region-messages collapsed">
    <a id="message-drawer-toggle-618b70a0b6293618b70a0b3c6d41" class="nav-link d-inline-block popover-region-toggle position-relative" href="#"
            role="button">
        <i class="icon fa fa-comment fa-fw "  title="Ouvrir/fermer le tiroir des messages" aria-label="Ouvrir/fermer le tiroir des messages"></i>
        <div class="count-container hidden" data-region="count-container"
        aria-label="Il y a 0 conversations non lues">0</div>
    </a>
</div></li>

                        <li class="nav-item dropdown ml-2 my-auto"><li class="nav-item dropdown my-auto"><a href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188" class="nav-link dropdown-toggle my-auto" role="button" id="langmenu0" aria-haspopup="true" aria-expanded="false" aria-controls="dropdownlangmenu0" data-target="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188" data-toggle="dropdown" title="Langue"><i class="fa fa-globe fa-lg"></i><span class="langdesc">Français ‎(fr)‎</span></a><ul role="menu" class="dropdown-menu" id="dropdownlangmenu0" aria-labelledby="langmenu0"><li><a title="English ‎(en)‎" class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188&amp;lang=en">English ‎(en)‎</a></li><li><a title="Français ‎(fr)‎" class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188&amp;lang=fr">Français ‎(fr)‎</a></li></ul></li></li>

                        
                        <li class="nav-item">
                            <li class="nav-item dropdown ml-3 ml-md-4 mr-2 mr-md-0"><a class="nav-link dropdown-toggle my-auto" role="button" href="#"
id="usermenu" data-toggle="dropdown"
aria-haspopup="true" aria-expanded="false"
aria-controls="usermenu-dropdown"
aria-label="Menu utilisateur"
title="Younes Yahya">
        <span class="d-none d-md-inline-block mx-1">Younes Yahya</span>
    <img src="https://moodle-n7.inp-toulouse.fr/pluginfile.php/112027/user/icon/adaptable/f1?rev=2753831" class="userpicture" width="50" height="50" alt="" />
</a>

<div class="dropdown-menu dropdown-menu-right" role="menu"
id="usermenu-dropdown"
aria-labelledby="usermenu" >
    <a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/my" title="Tableau de bord"><i aria-hidden="true" class="fa fa-dashboard"></i>Tableau de bord</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/user/profile.php" title="Consulter le profil"><i aria-hidden="true" class="fa fa-user"></i>Consulter le profil</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/user/edit.php" title="Modifier le profil"><i aria-hidden="true" class="fa fa-cog"></i>Modifier le profil</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/grade/report/overview/index.php" title="Notes"><i aria-hidden="true" class="fa fa-list-alt"></i>Notes</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/user/preferences.php" title="Préférences"><i aria-hidden="true" class="fa fa-cog"></i>Préférences</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/calendar/view.php" title="Calendrier"><i aria-hidden="true" class="fa fa-calendar"></i>Calendrier</a><a class="dropdown-item" href="https://moodle-n7.inp-toulouse.fr/login/logout.php?sesskey=RRoZ7cLYv6" title="Déconnexion"><i aria-hidden="true" class="fa fa-sign-out"></i>Déconnexion</a>
</div></li>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <div id="page-header" class="container d-none d-lg-block">
        <div class="row align-items-end">
            <div class="col-lg-8 p-0">
                <div class="d-none d-lg-flex justify-content-start bd-highlight">
                    <div class="p-2">
                        <div class="bd-highlight d-none d-lg-block"><a href=https://moodle-n7.inp-toulouse.fr aria-label="home" title="Moodle N7"><img src=//moodle-n7.inp-toulouse.fr/pluginfile.php/1/theme_adaptable/logo/1634298610/n7logo.jpg id="logo" alt="" /></a></div>
                    </div>
                </div>
                <div id="course-header">
                    
                </div>
            </div>
            <div class="col-lg-4">
                    <div class="socialbox socialicons d-none d-lg-block text-right">
    
</div>
            </div>

        </div>
    </div>

        <div id="nav-drawer" data-region="drawer" class="d-print-none moodle-has-zindex closed" aria-hidden="true" tabindex="-1">
            <div id="nav-drawer-inner">
                <nav class="list-group">
                    <ul class="list-unstyled components">
                        
                        <li>
                            
                        </li>
                    </ul>
                </nav>
        
                <nav class="list-group m-t-1">
                    
                    <a class="list-group-item list-group-item-action " href="https://moodle-n7.inp-toulouse.fr/admin/search.php">
                        <div class="m-l-0">
                            <div class="media">
                                <span class="media-left">
                                    <i class="icon fa fa-wrench fa-fw" aria-hidden="true"></i>
                                </span>
                                <span class="media-body ">Administration du site</span>
                            </div>
                        </div>
                    </a>
                </nav>
            </div>
        </div>
        
        <div id="main-navbar" class="d-none d-lg-block">
            <div class="container">
                <div class="navbar navbar-expand-md btco-hover-menu">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Basculer la navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
        
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        
                        <nav aria-label="Liens du site">
                            <ul class="navbar-nav">
                                
                                
                            </ul>
                        </nav>
        
                        <ul class="navbar-nav ml-auto">
        
        
                            <li class="nav-item mr-1">
                                <div id="zoominicon" class="left nav-link" title="Cacher les blocs" data-hidetitle="Cacher les blocs" data-showtitle="Afficher les blocs">
                                    <i class="fa fa-lg fa-outdent" aria-hidden="true"></i>
                                    <span class="showhideblocksdesc">Cacher les blocs</span>
                                </div>
                            </li>
        
                            <li class="nav-item mx-0 hbll">
                                <a class="nav-link moodlewidth" href="javascript:void(0);" title="Plein écran">
                                    <i class="fa fa-expand fa-lg" aria-hidden="true"></i>
                                    <span class="zoomdesc">Plein écran</span>
                                </a>
                            </li>
                            <li class="nav-item mx-0 sbll">
                                <a class="nav-link moodlewidth" href="javascript:void(0);" title="Vue standard">
                                    <i class="fa fa-compress fa-lg" aria-hidden="true"></i>
                                    <span class="zoomdesc">Vue standard</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

</header>
<div class="container outercont">
    <div class="row"><div id="page-second-header" class="col-12 pt-3 pb-3 d-none d-md-flex">
    <div class="d-flex flex-fill flex-wrap align-items-center">
        <div id="page-navbar" class="mr-auto">
            <nav role="navigation" aria-label="Fil d'ariane">
            <ol  class="breadcrumb d-none d-md-flex"><li><a href="https://moodle-n7.inp-toulouse.fr/"><i title="Accueil" class="fa fa-home fa-lg"></i></a></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="https://moodle-n7.inp-toulouse.fr/"><span itemprop="title">Accueil</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span tabindex="0">Mes cours</span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=365"><span itemprop="title">Département Sciences du Numérique</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=366"><span itemprop="title">1ère année FISE</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=395"><span itemprop="title">S5 - UE Traitement du Signal et Automatique</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" title="Langage C" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353"><span itemprop="title">Langage C</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=2"><span itemprop="title">SUJETS : Notebook Jupyter</span></a></span></li><span class="separator"><i class="fa-angle-right fa"></i></span><li><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" title="Dossier" aria-current="page" href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188"><span itemprop="title">Sujet pour les séances 1, 2 et 3 du Semestre 5</span></a></span></li></ol>
        </nav>
        </div>
    </div>
</div></div>    <div id="page-content" class="row flex-row-reverse">
        <section id="region-main" class="col-9">
            <span class="notifications" id="user-notifications"></span><div role="main"><span id="maincontent"></span><h2>Sujet pour les séances 1, 2 et 3 du Semestre 5</h2><div id="intro" class="box generalbox"><div class="no-overflow"><p></p><p>Le sujet du TP pour les 3 premières séances est disponible ici (mais aussi dans votre répertoire SVN) :<br></p><ul><li>au format Jupyter notebook, <br></li><li>au format HTML + fichiers .c de tous les programmes C présents dans le notebook.</li><li>les fichiers présents sous SVN.<br></li></ul><div>Le second format est disponible pour les étudiants qui n'arrivent pas à utiliser Jupyter.</div><br><p></p></div></div><div class="box generalbox pt-0 pb-3 foldertree"><div id="folder_tree0" class="filemanager"><ul><li><div class="fp-filename-icon"><span class="fp-icon"><img class="icon " alt="" aria-hidden="true" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/folder-24" /></span><span class="fp-filename"></span></div><ul><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/1SN_C1_fichiers_C.zip?forcedownload=1"><span class="fp-icon"><img class="icon " alt="1SN_C1_fichiers_C.zip" title="1SN_C1_fichiers_C.zip" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/archive-24" /></span><span class="fp-filename">1SN_C1_fichiers_C.zip</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/1SN_LangageC_C1.html?forcedownload=1"><span class="fp-icon"><img class="icon " alt="1SN_LangageC_C1.html" title="1SN_LangageC_C1.html" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/html-24" /></span><span class="fp-filename">1SN_LangageC_C1.html</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/1SN_LangageC_C1.ipynb?forcedownload=1"><span class="fp-icon"><img class="icon " alt="1SN_LangageC_C1.ipynb" title="1SN_LangageC_C1.ipynb" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/unknown-24" /></span><span class="fp-filename">1SN_LangageC_C1.ipynb</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/assert-comprendre.c?forcedownload=1"><span class="fp-icon"><img class="icon " alt="assert-comprendre.c" title="assert-comprendre.c" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/sourcecode-24" /></span><span class="fp-filename">assert-comprendre.c</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/Bilan2_Exercice1.txt?forcedownload=1"><span class="fp-icon"><img class="icon " alt="Bilan2_Exercice1.txt" title="Bilan2_Exercice1.txt" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/text-24" /></span><span class="fp-filename">Bilan2_Exercice1.txt</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/Makefile?forcedownload=1"><span class="fp-icon"><img class="icon " alt="Makefile" title="Makefile" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/unknown-24" /></span><span class="fp-filename">Makefile</span></a></span></li><li><span class="fp-filename-icon"><a href="https://moodle-n7.inp-toulouse.fr/pluginfile.php/83797/mod_folder/content/0/monnaie.c?forcedownload=1"><span class="fp-icon"><img class="icon " alt="monnaie.c" title="monnaie.c" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/core/1634298610/f/sourcecode-24" /></span><span class="fp-filename">monnaie.c</span></a></span></li></ul></li></ul></div></div><div class="box generalbox pt-0 pb-3 folderbuttons"><div class="singlebutton">
    <form method="post" action="https://moodle-n7.inp-toulouse.fr/mod/folder/download_folder.php" >
            <input type="hidden" name="id" value="49188">
            <input type="hidden" name="sesskey" value="RRoZ7cLYv6">
        <button type="submit" class="btn btn-secondary"
            id="single_button618b70a0b3c6d47"
            title=""
            
            >Télécharger le dossier</button>
    </form>
</div></div></div><nav class="activity_footer activity-navigation">
    <div class="row">
        <div class="col-md-6">
            <div class="float-left">
                <a href="https://moodle-n7.inp-toulouse.fr/mod/page/view.php?id=69258&forceview=1" id="prev-activity-link" class="previous_activity prevnext"  title="Dates limites rendus" ><span class="nav_icon"><i class="fa fa-angle-double-left"></i></span><span class="text"><span class="nav_guide">Activité précédente</span><br>Dates limites rendus</span></a>

            </div>
        </div>
        <div class="col-md-6">
            <div class="float-right">
                <a href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=59737&forceview=1" id="next-activity-link" class="next_activity prevnext"  title="Sujet pour les séances 4, 5 et 6 du Semestre 6" ><span class="text"><span class="nav_guide">Activité suivante</span><br>Sujet pour les séances 4, 5 et 6 du Semestre 6</span><span class="nav_icon"><i class="fa fa-angle-double-right"></i></span></a>

            </div>
        </div>
    </div>
</nav>
<div class="jumpnav">
    <div class="jumpmenu">
    <form method="post" action="https://moodle-n7.inp-toulouse.fr/course/jumpto.php" class="form-inline" id="url_select_f618b70a0b3c6d42">
        <input type="hidden" name="sesskey" value="RRoZ7cLYv6">
            <label for="jump-to-activity" class="sr-only">
                Aller à…
            </label>
        <select  id="jump-to-activity" class="custom-select jumpmenu" name="jump"
                 >
                    <option value="" selected>Aller à…</option>
                    <option value="/mod/forum/view.php?id=25096&amp;forceview=1" >Annonces</option>
                    <option value="/mod/forum/view.php?id=40118&amp;forceview=1" >Forum Questions/Réponses.</option>
                    <option value="/mod/page/view.php?id=58804&amp;forceview=1" >Liste + email des intervenants</option>
                    <option value="/mod/page/view.php?id=69151&amp;forceview=1" >Répertoire SVN</option>
                    <option value="/mod/page/view.php?id=69258&amp;forceview=1" >Dates limites rendus</option>
                    <option value="/mod/folder/view.php?id=59737&amp;forceview=1" >Sujet pour les séances 4, 5 et 6 du Semestre 6</option>
                    <option value="/mod/page/view.php?id=40108&amp;forceview=1" >Solution Installation 1 : Installation native Jupyter + kernel C.</option>
                    <option value="/mod/page/view.php?id=40109&amp;forceview=1" >Solution Installation 2 : Container Docker </option>
                    <option value="/mod/page/view.php?id=40126&amp;forceview=1" >Connexion à distance (X2Go)</option>
                    <option value="/mod/url/view.php?id=58494&amp;forceview=1" >URL - JDoodle</option>
                    <option value="/mod/resource/view.php?id=25759&amp;forceview=1" >Notes de Cours - Langage C</option>
                    <option value="/mod/resource/view.php?id=25753&amp;forceview=1" >Poly Langage C - Max Buvry</option>
                    <option value="/mod/folder/view.php?id=38293&amp;forceview=1" >Sujet + Corrigé QCM Semestre 5 janvier 2020</option>
                    <option value="/mod/folder/view.php?id=60923&amp;forceview=1" >Sujet + Corrige QCM - Semetre 6 - 05/05/2020</option>
        </select>
            <noscript>
                <input type="submit" class="btn btn-secondary ml-1" value="Valider">
            </noscript>
    </form>
</div>

</div>        </section>

        <aside id="block-region-side-post" class="col-3 d-print-none  block-region" data-blockregion="side-post" data-droptarget="1"><a class="skip skip-block" id="fsb-1" href="#sb-1">Passer Administration</a><section id="inst10940" class="block_settings block mb-3" role="navigation" data-block="settings" data-instanceid="10940" aria-labelledby="instance-10940-header"><div class="header"><div class="title"><div class="block_action"></div><h2 class="d-inline" id="instance-10940-header">Administration</h2><div class="block-controls float-right"></div></div></div><div class="content"><div id="settingsnav" class="box block_tree_box"><ul class="block_tree list" role="tree" data-ajax-loader="block_navigation/site_admin_loader"><li class="type_course depth_1 contains_branch" tabindex="-1" aria-labelledby="label_1_1"><p class="tree_item root_node tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d3_group"><span tabindex="0">Administration du cours</span></p><ul id="random618b70a0b3c6d3_group" role="group" aria-hidden="true"><li class="type_setting depth_2 item_with_icon" tabindex="-1" aria-labelledby="label_2_1"><p class="tree_item hasicon tree_item leaf" role="treeitem"><a href="https://moodle-n7.inp-toulouse.fr/enrol/self/unenrolself.php?enrolid=3816"><i class="icon fa fa-user fa-fw navicon" aria-hidden="true"  ></i>Me désinscrire de LangageC</a></p></li></ul></li></ul></div></div></section><span class="skip-block-to" id="sb-1"></span><a class="skip skip-block" id="fsb-2" href="#sb-2">Passer Navigation</a><section id="inst10939" class="block_navigation block mb-3" role="navigation" data-block="navigation" data-instanceid="10939" aria-labelledby="instance-10939-header"><div class="header"><div class="title"><div class="block_action"></div><h2 class="d-inline" id="instance-10939-header">Navigation</h2><div class="block-controls float-right"></div></div></div><div class="content"><ul class="block_tree list" role="tree" data-ajax-loader="block_navigation/nav_loader"><li class="type_unknown depth_1 contains_branch" aria-labelledby="label_1_1"><p class="tree_item branch canexpand navigation_node" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d5_group" data-collapsible="false"><a tabindex="-1" id="label_1_1" href="https://moodle-n7.inp-toulouse.fr/">Accueil</a></p><ul id="random618b70a0b3c6d5_group" role="group"><li class="type_setting depth_2 item_with_icon" aria-labelledby="label_2_2"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_2_2" href="https://moodle-n7.inp-toulouse.fr/my/"><i class="icon fa fa-tachometer fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Tableau de bord</span></a></p></li><li class="type_course depth_2 contains_branch" aria-labelledby="label_2_3"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d7_group"><span tabindex="-1" id="label_2_3" title="Moodle N7">Pages du site</span></p><ul id="random618b70a0b3c6d7_group" role="group" aria-hidden="true"><li class="type_unknown depth_3 item_with_icon" aria-labelledby="label_3_5"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_5" href="https://moodle-n7.inp-toulouse.fr/blog/index.php"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Blogs du site</span></a></p></li><li class="type_custom depth_3 item_with_icon" aria-labelledby="label_3_6"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_6" href="https://moodle-n7.inp-toulouse.fr/badges/view.php?type=1"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Badges de site</span></a></p></li><li class="type_setting depth_3 item_with_icon" aria-labelledby="label_3_7"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_7" href="https://moodle-n7.inp-toulouse.fr/tag/search.php"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Tags</span></a></p></li><li class="type_custom depth_3 item_with_icon" aria-labelledby="label_3_8"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_8" href="https://moodle-n7.inp-toulouse.fr/calendar/view.php?view=month&amp;course=1353"><i class="icon fa fa-calendar fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Calendrier</span></a></p></li><li class="type_activity depth_3 item_with_icon" aria-labelledby="label_3_10"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_10" title="Forum" href="https://moodle-n7.inp-toulouse.fr/mod/forum/view.php?id=1"><img class="icon navicon" alt="Forum" title="Forum" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/forum/1634298610/icon" /><span class="item-content-wrap">Brèves</span></a></p></li></ul></li><li class="type_system depth_2 contains_branch" aria-labelledby="label_2_11"><p class="tree_item branch" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d13_group"><span tabindex="-1" id="label_2_11">Mes cours</span></p><ul id="random618b70a0b3c6d13_group" role="group"><li class="type_unknown depth_3 contains_branch" aria-labelledby="label_3_12"><p class="tree_item branch" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d14_group"><a tabindex="-1" id="label_3_12" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=365">Département Sciences du Numérique</a></p><ul id="random618b70a0b3c6d14_group" role="group"><li class="type_unknown depth_4 contains_branch" aria-labelledby="label_4_13"><p class="tree_item branch" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d15_group"><a tabindex="-1" id="label_4_13" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=366">1ère année FISE</a></p><ul id="random618b70a0b3c6d15_group" role="group"><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_14"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d16_group"><a tabindex="-1" id="label_5_14" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=395">S5 - UE Traitement du Signal et Automatique</a></p><ul id="random618b70a0b3c6d16_group" role="group"><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_15"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1403" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1403" data-node-key="1403" data-node-type="20"><a tabindex="-1" id="label_6_15" title="Automatique" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1403">Automatique</a></p></li><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_16"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d17_group"><a tabindex="-1" id="label_6_16" title="Langage C" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353">Langage C</a></p><ul id="random618b70a0b3c6d17_group" role="group"><li class="type_container depth_7 contains_branch" aria-labelledby="label_7_17"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d18_group"><a tabindex="-1" id="label_7_17" href="https://moodle-n7.inp-toulouse.fr/user/index.php?id=1353">Participants</a></p><ul id="random618b70a0b3c6d18_group" role="group" aria-hidden="true"><li class="type_setting depth_8 item_with_icon" aria-labelledby="label_8_18"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_8_18" href="https://moodle-n7.inp-toulouse.fr/blog/index.php?courseid=1353"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Blogs de cours</span></a></p></li><li class="type_user depth_8 item_with_icon" aria-labelledby="label_8_19"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_8_19" href="https://moodle-n7.inp-toulouse.fr/user/view.php?id=11025&amp;course=1353"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Younes Yahya</span></a></p></li></ul></li><li class="type_setting depth_7 item_with_icon" aria-labelledby="label_7_20"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_7_20" href="https://moodle-n7.inp-toulouse.fr/badges/view.php?type=2&amp;id=1353"><i class="icon fa fa-shield fa-fw navicon"  title="Badges" aria-label="Badges"></i><span class="item-content-wrap">Badges</span></a></p></li><li class="type_setting depth_7 item_with_icon" aria-labelledby="label_7_21"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_7_21" href="https://moodle-n7.inp-toulouse.fr/admin/tool/lp/coursecompetencies.php?courseid=1353"><i class="icon fa fa-check-square-o fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Compétences</span></a></p></li><li class="type_setting depth_7 item_with_icon" aria-labelledby="label_7_22"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_7_22" href="https://moodle-n7.inp-toulouse.fr/grade/report/index.php?id=1353"><i class="icon fa fa-table fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Notes</span></a></p></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_23"><p class="tree_item branch" role="treeitem" id="expandable_branch_30_12299" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_30_12299" data-node-key="12299" data-node-type="30"><span tabindex="-1" id="label_7_23">Langage C</span></p></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_24"><p class="tree_item branch" role="treeitem" aria-expanded="true" aria-owns="random618b70a0b3c6d24_group"><a tabindex="-1" id="label_7_24" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=2">SUJETS : Notebook Jupyter</a></p><ul id="random618b70a0b3c6d24_group" role="group"><li class="type_activity depth_8 item_with_icon current_branch" aria-labelledby="label_8_25"><p class="tree_item hasicon active_tree_node" role="treeitem"><a tabindex="-1" id="label_8_25" title="Dossier" href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=49188"><img class="icon navicon" alt="Dossier" title="Dossier" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/folder/1634298610/icon" /><span class="item-content-wrap">Sujet pour les séances 1, 2 et 3 du Semestre 5</span></a></p></li><li class="type_activity depth_8 item_with_icon" aria-labelledby="label_8_26"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_8_26" title="Dossier" href="https://moodle-n7.inp-toulouse.fr/mod/folder/view.php?id=59737"><img class="icon navicon" alt="Dossier" title="Dossier" src="https://moodle-n7.inp-toulouse.fr/theme/image.php/adaptable/folder/1634298610/icon" /><span class="item-content-wrap">Sujet pour les séances 4, 5 et 6 du Semestre 6</span></a></p></li></ul></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_28"><p class="tree_item branch" role="treeitem" id="expandable_branch_30_16581" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_30_16581" data-node-key="16581" data-node-type="30"><a tabindex="-1" id="label_7_28" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=3">Première utilisation à l'ENSEEIHT</a></p></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_29"><p class="tree_item branch" role="treeitem" id="expandable_branch_30_15818" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_30_15818" data-node-key="15818" data-node-type="30"><a tabindex="-1" id="label_7_29" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=4">Installer Jupyter notebook avec le kernel C sur so...</a></p></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_30"><p class="tree_item branch" role="treeitem" id="expandable_branch_30_12691" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_30_12691" data-node-key="12691" data-node-type="30"><a tabindex="-1" id="label_7_30" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=5">Ressources</a></p></li><li class="type_structure depth_7 contains_branch" aria-labelledby="label_7_31"><p class="tree_item branch" role="treeitem" id="expandable_branch_30_16106" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_30_16106" data-node-key="16106" data-node-type="30"><a tabindex="-1" id="label_7_31" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;section=10">QCM Corrigés</a></p></li><li class="type_setting depth_7 item_with_icon" aria-labelledby="label_7_32"><p class="tree_item hasicon tiles_coursenav hidden" role="treeitem" id="tiles_stopjsnav"><a tabindex="-1" id="label_7_32" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;stopjsnav=1"><i class="icon fa fa-toggle-on fa-fw navicon"  title="Désactiver la navigation animée" aria-label="Désactiver la navigation animée"></i><span class="item-content-wrap">Désactiver la navigation animée</span></a></p></li><li class="type_setting depth_7 item_with_icon" aria-labelledby="label_7_33"><p class="tree_item hasicon tiles_coursenav hidden" role="treeitem" id="tiles_datapref"><a tabindex="-1" id="label_7_33" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1353&amp;datapref=1"><i class="icon fa fa-database fa-fw navicon"  title="Préférence pour les données" aria-label="Préférence pour les données"></i><span class="item-content-wrap">Préférence pour les données</span></a></p></li></ul></li></ul></li><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_34"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d27_group"><a tabindex="-1" id="label_5_34" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=387">S5 - UE Analyse Numérique - Statistiques</a></p><ul id="random618b70a0b3c6d27_group" role="group" aria-hidden="true"><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_35"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1387" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1387" data-node-key="1387" data-node-type="20"><a tabindex="-1" id="label_6_35" title="EDP" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1387">EDP</a></p></li><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_36"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1321" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1321" data-node-key="1321" data-node-type="20"><a tabindex="-1" id="label_6_36" title="Optimisation" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1321">Optimisation</a></p></li></ul></li><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_37"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d28_group"><a tabindex="-1" id="label_5_37" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=386">S5 - UE Intégration et applications - Probabilités</a></p><ul id="random618b70a0b3c6d28_group" role="group" aria-hidden="true"><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_38"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1539" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1539" data-node-key="1539" data-node-type="20"><a tabindex="-1" id="label_6_38" title="Intégration et applications" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1539">Intégration et applications</a></p></li></ul></li><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_40"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d29_group"><a tabindex="-1" id="label_5_40" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=377">S5 - UE Modélisation et Architecture</a></p><ul id="random618b70a0b3c6d29_group" role="group" aria-hidden="true"><li class="type_course depth_6 contains_branch" aria-labelledby="label_6_41"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1354" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1354" data-node-key="1354" data-node-type="20"><a tabindex="-1" id="label_6_41" title="Modélisation" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1354">Modélisation</a></p></li></ul></li></ul></li><li class="type_unknown depth_4 contains_branch" aria-labelledby="label_4_42"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d30_group"><a tabindex="-1" id="label_4_42" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=367">2ème année FISE</a></p><ul id="random618b70a0b3c6d30_group" role="group" aria-hidden="true"><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_43"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d31_group"><a tabindex="-1" id="label_5_43" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=701">Ensemble des UEs de S7</a></p><ul id="random618b70a0b3c6d31_group" role="group" aria-hidden="true"><li class="type_unknown depth_6 contains_branch" aria-labelledby="label_6_44"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d32_group"><a tabindex="-1" id="label_6_44" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=434">N7EN13 - UE Programmation fonctionnelle </a></p><ul id="random618b70a0b3c6d32_group" role="group" aria-hidden="true"><li class="type_course depth_7 contains_branch" aria-labelledby="label_7_45"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1498" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1498" data-node-key="1498" data-node-type="20"><a tabindex="-1" id="label_7_45" title="N7EN13A -  Programmation Fonctionnelle" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1498">N7EN13A -  Programmation Fonctionnelle</a></p></li></ul></li></ul></li></ul></li></ul></li><li class="type_unknown depth_3 contains_branch" aria-labelledby="label_3_46"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d33_group"><a tabindex="-1" id="label_3_46" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=23">Soft Skills Center </a></p><ul id="random618b70a0b3c6d33_group" role="group" aria-hidden="true"><li class="type_unknown depth_4 contains_branch" aria-labelledby="label_4_47"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d34_group"><a tabindex="-1" id="label_4_47" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=354">SPORT, CAREERS &amp; MANAGEMENT, LANGUAGES</a></p><ul id="random618b70a0b3c6d34_group" role="group" aria-hidden="true"><li class="type_unknown depth_5 contains_branch" aria-labelledby="label_5_48"><p class="tree_item branch" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d35_group"><a tabindex="-1" id="label_5_48" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=356">CAREERS &amp; MANAGEMENT - CAM </a></p><ul id="random618b70a0b3c6d35_group" role="group" aria-hidden="true"><li class="type_unknown depth_6 contains_branch" aria-labelledby="label_6_49"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d36_group"><a tabindex="-1" id="label_6_49" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=359">L3 </a></p><ul id="random618b70a0b3c6d36_group" role="group" aria-hidden="true"><li class="type_course depth_7 contains_branch" aria-labelledby="label_7_50"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_1326" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_1326" data-node-key="1326" data-node-type="20"><a tabindex="-1" id="label_7_50" title="FISE MODULE 1 : PROFESSIONAL NETWORKING (+ ePortfolio upload)" href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=1326">FISE MODULE 1 : PROFESSIONAL NETWORKING (+ ePortfo...</a></p></li></ul></li></ul></li></ul></li><li class="type_unknown depth_4 contains_branch" aria-labelledby="label_4_51"><p class="tree_item branch canexpand" role="treeitem" aria-expanded="false" aria-owns="random618b70a0b3c6d37_group"><a tabindex="-1" id="label_4_51" href="https://moodle-n7.inp-toulouse.fr/course/index.php?categoryid=699">INFOS RENTREE : groupes, salles, liens Zoom, etc.</a></p><ul id="random618b70a0b3c6d37_group" role="group" aria-hidden="true"><li class="type_course depth_5 contains_branch" aria-labelledby="label_5_52"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_2335" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_2335" data-node-key="2335" data-node-type="20"><a tabindex="-1" id="label_5_52" title="INFOS &amp; GROUPES " href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=2335">INFOS &amp; GROUPES </a></p></li><li class="type_course depth_5 contains_branch" aria-labelledby="label_5_53"><p class="tree_item branch" role="treeitem" id="expandable_branch_20_2336" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_20_2336" data-node-key="2336" data-node-type="20"><a tabindex="-1" id="label_5_53" title="LIENS ZOOM " href="https://moodle-n7.inp-toulouse.fr/course/view.php?id=2336">LIENS ZOOM </a></p></li></ul></li></ul></li><li class="type_custom depth_3 item_with_icon" aria-labelledby="label_3_55"><p class="tree_item hasicon" role="treeitem"><a tabindex="-1" id="label_3_55" href="https://moodle-n7.inp-toulouse.fr/my/"><i class="icon fa fa-fw fa-fw navicon" aria-hidden="true"  ></i><span class="item-content-wrap">Plus…</span></a></p></li></ul></li><li class="type_system depth_2 contains_branch" aria-labelledby="label_2_56"><p class="tree_item branch" role="treeitem" id="expandable_branch_0_courses" aria-expanded="false" data-requires-ajax="true" data-loaded="false" data-node-id="expandable_branch_0_courses" data-node-key="courses" data-node-type="0"><a tabindex="-1" id="label_2_56" href="https://moodle-n7.inp-toulouse.fr/course/index.php">Cours</a></p></li></ul></li></ul></div></section><span class="skip-block-to" id="sb-2"></span></aside><div id="showsidebaricon" title="Afficher / cacher la sidebar"><i class="fa fa-3x fa-angle-left" aria-hidden="true"></i></div>    </div>
</div>

<div
    id="drawer-618b70a0b704b618b70a0b3c6d45"
    class=" drawer bg-white hidden"
    aria-expanded="false"
    aria-hidden="true"
    data-region="right-hand-drawer"
    role="region"
    tabindex="0"
>
            <div class="drawer-top p-2 border-bottom bg-messageheader">
            Messages personnels
            <a id="message-drawer-close-618b70a0b704b618b70a0b3c6d45" class="pull-right" href="#" role="button">
                <i class="icon fa fa-window-close fa-fw "  title="Ouvrir/fermer le tiroir des messages" aria-label="Ouvrir/fermer le tiroir des messages"></i>
            </a>
        </div>
        <div id="message-drawer-618b70a0b704b618b70a0b3c6d45" class="message-app" data-region="message-drawer" role="region">
            <div class="header-container position-relative" data-region="header-container">
                <div class="hidden border-bottom px-2 py-3" aria-hidden="true" data-region="view-contacts">
                    <div class="d-flex align-items-center">
                        <div class="align-self-stretch">
                            <a class="h-100 d-flex align-items-center mr-2" href="#" data-route-back role="button">
                                <div class="icon-back-in-drawer">
                                    <span class="dir-rtl-hide"><i class="icon fa fa-chevron-left fa-fw " aria-hidden="true"  ></i></span>
                                    <span class="dir-ltr-hide"><i class="icon fa fa-chevron-right fa-fw " aria-hidden="true"  ></i></span>
                                </div>
                                <div class="icon-back-in-app">
                                    <span class="dir-rtl-hide"><i class="icon fa fa-times fa-fw " aria-hidden="true"  ></i></span>
                                </div>                            </a>
                        </div>
                        <div>
                            Contacts
                        </div>
                        <div class="ml-auto">
                            <a href="#" data-route="view-search" role="button" aria-label="Recherche">
                                <i class="icon fa fa-search fa-fw " aria-hidden="true"  ></i>
                            </a>
                        </div>
                    </div>
                </div>                
                <div
                    class="hidden bg-white position-relative border-bottom p-1 p-sm-2"
                    aria-hidden="true"
                    data-region="view-conversation"
                >
                    <div class="hidden" data-region="header-content"></div>
                    <div class="hidden" data-region="header-edit-mode">
                        
                        <div class="d-flex p-2 align-items-center">
                            Messages sélectionnés :
                            <span class="ml-1" data-region="message-selected-court">1</span>
                            <button type="button" class="ml-auto close" aria-label="Annuler la sélection de message"
                                data-action="cancel-edit-mode">
                                    <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                    <div data-region="header-placeholder">
                        <div class="d-flex">
                            <div
                                class="ml-2 rounded-circle bg-pulse-grey align-self-center"
                                style="height: 38px; width: 38px"
                            >
                            </div>
                            <div class="ml-2 " style="flex: 1">
                                <div
                                    class="mt-1 bg-pulse-grey w-75"
                                    style="height: 16px;"
                                >
                                </div>
                            </div>
                            <div
                                class="ml-2 bg-pulse-grey align-self-center"
                                style="height: 16px; width: 20px"
                            >
                            </div>
                        </div>
                    </div>
                    <div
                        class="hidden position-absolute z-index-1"
                        data-region="confirm-dialogue-container"
                        style="top: 0; bottom: -1px; right: 0; left: 0; background: rgba(0,0,0,0.3);"
                    ></div>
                </div>                <div class="border-bottom  p-1 px-sm-2 py-sm-3" aria-hidden="false"  data-region="view-overview">
                    <div class="d-flex align-items-center">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text pr-2 bg-white">
                                    <i class="icon fa fa-search fa-fw " aria-hidden="true"  ></i>
                                </span>
                            </div>
                            <input
                                type="text"
                                class="form-control border-left-0"
                                placeholder="Recherche"
                                aria-label="Recherche"
                                data-region="view-overview-search-input"
                            >
                        </div>
                        <div class="ml-2">
                            <a
                                href="#"
                                data-route="view-settings"
                                data-route-param="11025"
                                aria-label="Réglages"
                                role="button"
                            >
                                <i class="icon fa fa-cog fa-fw " aria-hidden="true"  ></i>
                            </a>
                        </div>
                    </div>
                    <div class="text-right mt-sm-3">
                        <a href="#" data-route="view-contacts" role="button">
                            <i class="icon fa fa-user fa-fw " aria-hidden="true"  ></i>
                            Contacts
                            <span class="badge badge-primary bg-primary ml-2 hidden"
                            data-region="contact-request-count"
                            aria-label="Il y a 0 demandes de contact en attente">
                                0
                            </span>
                        </a>
                    </div>
                </div>
                
                <div class="hidden border-bottom px-2 py-3 view-search"  aria-hidden="true" data-region="view-search">
                    <div class="d-flex align-items-center">
                        <a
                            class="mr-2 align-self-stretch d-flex align-items-center"
                            href="#"
                            data-route-back
                            data-action="cancel-search"
                            role="button"
                        >
                            <div class="icon-back-in-drawer">
                                <span class="dir-rtl-hide"><i class="icon fa fa-chevron-left fa-fw " aria-hidden="true"  ></i></span>
                                <span class="dir-ltr-hide"><i class="icon fa fa-chevron-right fa-fw " aria-hidden="true"  ></i></span>
                            </div>
                            <div class="icon-back-in-app">
                                <span class="dir-rtl-hide"><i class="icon fa fa-times fa-fw " aria-hidden="true"  ></i></span>
                            </div>                        </a>
                        <div class="input-group">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Recherche"
                                aria-label="Recherche"
                                data-region="search-input"
                            >
                            <div class="input-group-append">
                                <button
                                    class="btn btn-outline-secondary"
                                    type="button"
                                    data-action="search"
                                    aria-label="Recherche"
                                >
                                    <span data-region="search-icon-container">
                                        <i class="icon fa fa-search fa-fw " aria-hidden="true"  ></i>
                                    </span>
                                    <span class="hidden" data-region="loading-icon-container">
                                        <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>                
                <div class="hidden border-bottom px-2 py-3" aria-hidden="true" data-region="view-settings">
                    <div class="d-flex align-items-center">
                        <div class="align-self-stretch" >
                            <a class="h-100 d-flex mr-2 align-items-center" href="#" data-route-back role="button">
                                <div class="icon-back-in-drawer">
                                    <span class="dir-rtl-hide"><i class="icon fa fa-chevron-left fa-fw " aria-hidden="true"  ></i></span>
                                    <span class="dir-ltr-hide"><i class="icon fa fa-chevron-right fa-fw " aria-hidden="true"  ></i></span>
                                </div>
                                <div class="icon-back-in-app">
                                    <span class="dir-rtl-hide"><i class="icon fa fa-times fa-fw " aria-hidden="true"  ></i></span>
                                </div>                            </a>
                        </div>
                        <div>
                            Paramètres
                        </div>
                    </div>
                </div>
            </div>
            <div class="body-container position-relative" data-region="body-container">
                
                <div
                    class="hidden"
                    data-region="view-contact"
                    aria-hidden="true"
                >
                    <div class="p-2 pt-3" data-region="content-container"></div>
                </div>                <div class="hidden h-100" data-region="view-contacts" aria-hidden="true" data-user-id="11025">
                    <div class="d-flex flex-column h-100">
                        <div class="p-3 border-bottom">
                            <ul class="nav nav-pills nav-fill" role="tablist">
                                <li class="nav-item">
                                    <a
                                        id="contacts-tab-618b70a0b704b618b70a0b3c6d45"
                                        class="nav-link active"
                                        href="#contacts-tab-panel-618b70a0b704b618b70a0b3c6d45"
                                        data-toggle="tab"
                                        data-action="show-contacts-section"
                                        role="tab"
                                        aria-controls="contacts-tab-panel-618b70a0b704b618b70a0b3c6d45"
                                        aria-selected="true"
                                    >
                                        Contacts
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a
                                        id="requests-tab-618b70a0b704b618b70a0b3c6d45"
                                        class="nav-link"
                                        href="#requests-tab-panel-618b70a0b704b618b70a0b3c6d45"
                                        data-toggle="tab"
                                        data-action="show-requests-section"
                                        role="tab"
                                        aria-controls="requests-tab-panel-618b70a0b704b618b70a0b3c6d45"
                                        aria-selected="false"
                                    >
                                        Demandes
                                        <span class="badge badge-primary bg-primary ml-2 hidden"
                                        data-region="contact-request-count"
                                        aria-label="Il y a 0 demandes de contact en attente">
                                            0
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content d-flex flex-column h-100">
                                            <div
                    class="tab-pane fade show active h-100 lazy-load-list"
                    aria-live="polite"
                    data-region="lazy-load-list"
                    data-user-id="11025"
                                        id="contacts-tab-panel-618b70a0b704b618b70a0b3c6d45"
                    data-section="contacts"
                    role="tabpanel"
                    aria-labelledby="contacts-tab-618b70a0b704b618b70a0b3c6d45"

                >
                    
                    <div class="hidden text-center p-2" data-region="empty-message-container">
                        Aucun contact
                    </div>
                    <div class="hidden list-group" data-region="content-container">
                        
                    </div>
                    <div class="list-group" data-region="placeholder-container">
                        
                    </div>
                    <div class="w-100 text-center p-3 hidden" data-region="loading-icon-container" >
                        <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                    </div>
                </div>
                
                                            <div
                    class="tab-pane fade h-100 lazy-load-list"
                    aria-live="polite"
                    data-region="lazy-load-list"
                    data-user-id="11025"
                                        id="requests-tab-panel-618b70a0b704b618b70a0b3c6d45"
                    data-section="requests"
                    role="tabpanel"
                    aria-labelledby="requests-tab-618b70a0b704b618b70a0b3c6d45"

                >
                    
                    <div class="hidden text-center p-2" data-region="empty-message-container">
                        Aucune demande de contact
                    </div>
                    <div class="hidden list-group" data-region="content-container">
                        
                    </div>
                    <div class="list-group" data-region="placeholder-container">
                        
                    </div>
                    <div class="w-100 text-center p-3 hidden" data-region="loading-icon-container" >
                        <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                    </div>
                </div>
                        </div>
                    </div>
                </div>                
                <div
                    class="view-conversation hidden h-100"
                    aria-hidden="true"
                    data-region="view-conversation"
                    data-user-id="11025"
                    data-midnight="1636498800"
                    data-message-poll-min="10"
                    data-message-poll-max="120"
                    data-message-poll-after-max="300"
                    style="overflow-y: auto; overflow-x: hidden"
                >
                    <div class="position-relative h-100" data-region="content-container" style="overflow-y: auto; overflow-x: hidden">
                        <div class="content-message-container hidden h-100 px-2 pt-0" data-region="content-message-container" role="log" style="overflow-y: auto; overflow-x: hidden">
                            <div class="py-3 sticky-top z-index-1 border-bottom text-center hidden" data-region="contact-request-sent-message-container">
                                <p class="m-0">Demande de contact envoyée</p>
                                <p class="font-italic font-weight-light" data-region="text"></p>
                            </div>
                            <div class="p-3 text-center hidden" data-region="self-conversation-message-container">
                                <p class="m-0">Espace personnel</p>
                                <p class="font-italic font-weight-light" data-region="text">Enregistrer des brouillons, liens, note, etc. pour un usage ultérieur.</p>
                           </div>
                            <div class="hidden text-center p-3" data-region="more-messages-loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</div>
                        </div>
                        <div class="p-4 w-100 h-100 hidden position-absolute z-index-1" data-region="confirm-dialogue-container" style="top: 0; background: rgba(0,0,0,0.3);">
                            
                            <div class="p-3 bg-white" data-region="confirm-dialogue" role="alert">
                                <p class="text-muted" data-region="dialogue-text"></p>
                                <div class="mb-2 custom-control custom-checkbox hidden" data-region="delete-messages-for-all-users-toggle-container">
                                    <input type="checkbox" class="custom-control-input" id="delete-messages-for-all-users" data-region="delete-messages-for-all-users-toggle">
                                    <label class="custom-control-label text-muted" for="delete-messages-for-all-users">
                                        Supprimer pour moi et et pour tous les autres
                                    </label>
                                </div>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-block">
                                    <span data-region="dialogue-button-text">Bloc</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-unblock">
                                    <span data-region="dialogue-button-text">Débloquer</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-remove-contact">
                                    <span data-region="dialogue-button-text">Supprimer</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-add-contact">
                                    <span data-region="dialogue-button-text">Ajouter</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-delete-selected-messages">
                                    <span data-region="dialogue-button-text">Supprimer</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="confirm-delete-conversation">
                                    <span data-region="dialogue-button-text">Supprimer</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="request-add-contact">
                                    <span data-region="dialogue-button-text">Envoyer une demande de contact</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block hidden" data-action="accept-contact-request">
                                    <span data-region="dialogue-button-text">Accepter et ajouter aux contacts</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-secondary btn-block hidden" data-action="decline-contact-request">
                                    <span data-region="dialogue-button-text">Décliner</span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-block" data-action="okay-confirm">OK</button>
                                <button type="button" class="btn btn-secondary btn-block" data-action="cancel-confirm">Annuler</button>
                            </div>
                        </div>
                        <div class="px-2 pb-2 pt-0" data-region="content-placeholder">
                            <div class="h-100 d-flex flex-column">
                                <div
                                    class="px-2 pb-2 pt-0 bg-light h-100"
                                    style="overflow-y: auto"
                                >
                                    <div class="mt-4">
                                        <div class="mb-4">
                                            <div class="mx-auto bg-white" style="height: 25px; width: 100px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                    </div>                                    <div class="mt-4">
                                        <div class="mb-4">
                                            <div class="mx-auto bg-white" style="height: 25px; width: 100px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                    </div>                                    <div class="mt-4">
                                        <div class="mb-4">
                                            <div class="mx-auto bg-white" style="height: 25px; width: 100px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                    </div>                                    <div class="mt-4">
                                        <div class="mb-4">
                                            <div class="mx-auto bg-white" style="height: 25px; width: 100px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                    </div>                                    <div class="mt-4">
                                        <div class="mb-4">
                                            <div class="mx-auto bg-white" style="height: 25px; width: 100px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                        <div class="d-flex flex-column p-2 bg-white rounded mb-2">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="mr-2">
                                                    <div class="rounded-circle bg-pulse-grey" style="height: 35px; width: 35px"></div>
                                                </div>
                                                <div class="mr-4 w-75 bg-pulse-grey" style="height: 16px"></div>
                                                <div class="ml-auto bg-pulse-grey" style="width: 35px; height: 16px"></div>
                                            </div>
                                            <div class="bg-pulse-grey w-100" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-100 mt-2" style="height: 16px"></div>
                                            <div class="bg-pulse-grey w-75 mt-2" style="height: 16px"></div>
                                        </div>
                                    </div>                                </div>
                            </div>                        </div>
                    </div>
                </div>
                
                <div
                    class="hidden"
                    aria-hidden="true"
                    data-region="view-group-info"
                >
                    <div
                        class="pt-3 h-100 d-flex flex-column"
                        data-region="group-info-content-container"
                        style="overflow-y: auto"
                    ></div>
                </div>                <div class="h-100 view-overview-body" aria-hidden="false" data-region="view-overview"  data-user-id="11025">
                    <div id="message-drawer-view-overview-container-618b70a0b704b618b70a0b3c6d45" class="d-flex flex-column h-100" style="overflow-y: auto">
                            
                            
                            <div
                                class="section border-0 card"
                                data-region="view-overview-favourites"
                            >
                                <div id="view-overview-favourites-toggle" class="card-header p-0" data-region="toggle">
                                    <button
                                        class="btn btn-link w-100 text-left p-1 p-sm-2 d-flex align-items-center overview-section-toggle collapsed"
                                        data-toggle="collapse"
                                        data-target="#view-overview-favourites-target-618b70a0b704b618b70a0b3c6d45"
                                        aria-expanded="false"
                                        aria-controls="view-overview-favourites-target-618b70a0b704b618b70a0b3c6d45"
                                    >
                                        <span class="collapsed-icon-container">
                                            <i class="icon fa fa-caret-right fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="expanded-icon-container">
                                            <i class="icon fa fa-caret-down fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="font-weight-bold">Favoris</span>
                                        <small class="hidden ml-1" data-region="section-total-count-container"
                                        aria-label=" conversations">
                                            (<span data-region="section-total-count"></span>)
                                        </small>
                                        <span class="hidden ml-2" data-region="loading-icon-container">
                                            <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                        </span>
                                        <span class="hidden badge badge-pill badge-primary ml-auto bg-primary"
                                        data-region="section-unread-count"
                                        >
                                            
                                        </span>
                                    </button>
                                </div>
                                                            <div
                                class="collapse border-bottom  lazy-load-list"
                                aria-live="polite"
                                data-region="lazy-load-list"
                                data-user-id="11025"
                                            id="view-overview-favourites-target-618b70a0b704b618b70a0b3c6d45"
            aria-labelledby="view-overview-favourites-toggle"
            data-parent="#message-drawer-view-overview-container-618b70a0b704b618b70a0b3c6d45"

                            >
                                
                                <div class="hidden text-center p-2" data-region="empty-message-container">
                                            <p class="text-muted mt-2">Aucune conversation favorite</p>

                                </div>
                                <div class="hidden list-group" data-region="content-container">
                                    
                                </div>
                                <div class="list-group" data-region="placeholder-container">
                                            <div class="text-center py-2"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</div>

                                </div>
                                <div class="w-100 text-center p-3 hidden" data-region="loading-icon-container" >
                                    <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                </div>
                            </div>
                            </div>
                            
                            
                            <div
                                class="section border-0 card"
                                data-region="view-overview-group-messages"
                            >
                                <div id="view-overview-group-messages-toggle" class="card-header p-0" data-region="toggle">
                                    <button
                                        class="btn btn-link w-100 text-left p-1 p-sm-2 d-flex align-items-center overview-section-toggle collapsed"
                                        data-toggle="collapse"
                                        data-target="#view-overview-group-messages-target-618b70a0b704b618b70a0b3c6d45"
                                        aria-expanded="false"
                                        aria-controls="view-overview-group-messages-target-618b70a0b704b618b70a0b3c6d45"
                                    >
                                        <span class="collapsed-icon-container">
                                            <i class="icon fa fa-caret-right fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="expanded-icon-container">
                                            <i class="icon fa fa-caret-down fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="font-weight-bold">Groupe</span>
                                        <small class="hidden ml-1" data-region="section-total-count-container"
                                        aria-label=" conversations">
                                            (<span data-region="section-total-count"></span>)
                                        </small>
                                        <span class="hidden ml-2" data-region="loading-icon-container">
                                            <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                        </span>
                                        <span class="hidden badge badge-pill badge-primary ml-auto bg-primary"
                                        data-region="section-unread-count"
                                        >
                                            
                                        </span>
                                    </button>
                                </div>
                                                            <div
                                class="collapse border-bottom  lazy-load-list"
                                aria-live="polite"
                                data-region="lazy-load-list"
                                data-user-id="11025"
                                            id="view-overview-group-messages-target-618b70a0b704b618b70a0b3c6d45"
            aria-labelledby="view-overview-group-messages-toggle"
            data-parent="#message-drawer-view-overview-container-618b70a0b704b618b70a0b3c6d45"

                            >
                                
                                <div class="hidden text-center p-2" data-region="empty-message-container">
                                            <p class="text-muted mt-2">Pas de conversation de groupe</p>

                                </div>
                                <div class="hidden list-group" data-region="content-container">
                                    
                                </div>
                                <div class="list-group" data-region="placeholder-container">
                                            <div class="text-center py-2"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</div>

                                </div>
                                <div class="w-100 text-center p-3 hidden" data-region="loading-icon-container" >
                                    <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                </div>
                            </div>
                            </div>
                            
                            
                            <div
                                class="section border-0 card"
                                data-region="view-overview-messages"
                            >
                                <div id="view-overview-messages-toggle" class="card-header p-0" data-region="toggle">
                                    <button
                                        class="btn btn-link w-100 text-left p-1 p-sm-2 d-flex align-items-center overview-section-toggle collapsed"
                                        data-toggle="collapse"
                                        data-target="#view-overview-messages-target-618b70a0b704b618b70a0b3c6d45"
                                        aria-expanded="false"
                                        aria-controls="view-overview-messages-target-618b70a0b704b618b70a0b3c6d45"
                                    >
                                        <span class="collapsed-icon-container">
                                            <i class="icon fa fa-caret-right fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="expanded-icon-container">
                                            <i class="icon fa fa-caret-down fa-fw " aria-hidden="true"  ></i>
                                        </span>
                                        <span class="font-weight-bold">Privée</span>
                                        <small class="hidden ml-1" data-region="section-total-count-container"
                                        aria-label=" conversations">
                                            (<span data-region="section-total-count"></span>)
                                        </small>
                                        <span class="hidden ml-2" data-region="loading-icon-container">
                                            <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                        </span>
                                        <span class="hidden badge badge-pill badge-primary ml-auto bg-primary"
                                        data-region="section-unread-count"
                                        >
                                            
                                        </span>
                                    </button>
                                </div>
                                                            <div
                                class="collapse border-bottom  lazy-load-list"
                                aria-live="polite"
                                data-region="lazy-load-list"
                                data-user-id="11025"
                                            id="view-overview-messages-target-618b70a0b704b618b70a0b3c6d45"
            aria-labelledby="view-overview-messages-toggle"
            data-parent="#message-drawer-view-overview-container-618b70a0b704b618b70a0b3c6d45"

                            >
                                
                                <div class="hidden text-center p-2" data-region="empty-message-container">
                                            <p class="text-muted mt-2">Pas de conversation privée</p>

                                </div>
                                <div class="hidden list-group" data-region="content-container">
                                    
                                </div>
                                <div class="list-group" data-region="placeholder-container">
                                            <div class="text-center py-2"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</div>

                                </div>
                                <div class="w-100 text-center p-3 hidden" data-region="loading-icon-container" >
                                    <span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
                                </div>
                            </div>
                            </div>
                    </div>
                </div>
                
                <div
                    data-region="view-search"
                    aria-hidden="true"
                    class="h-100 hidden"
                    data-user-id="11025"
                    data-users-offset="0"
                    data-messages-offset="0"
                    style="overflow-y: auto"
                    
                >
                    <div class="hidden" data-region="search-results-container" style="overflow-y: auto">
                        
                        <div class="d-flex flex-column">
                            <div class="mb-3 bg-white" data-region="all-contacts-container">
                                <div data-region="contacts-container"  class="pt-2">
                                    <h4 class="h6 px-2">Contacts</h4>
                                    <div class="list-group" data-region="list"></div>
                                </div>
                                <div data-region="non-contacts-container" class="pt-2 border-top">
                                    <h4 class="h6 px-2">Non contact</h4>
                                    <div class="list-group" data-region="list"></div>
                                </div>
                                <div class="text-right">
                                    <button class="btn btn-link text-primary" data-action="load-more-users">
                                        <span data-region="button-text">Charger plus</span>
                                        <span data-region="loading-icon-container" class="hidden"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                    </button>
                                </div>
                            </div>
                            <div class="bg-white" data-region="messages-container">
                                <h4 class="h6 px-2 pt-2">Messages personnels</h4>
                                <div class="list-group" data-region="list"></div>
                                <div class="text-right">
                                    <button class="btn btn-link text-primary" data-action="load-more-messages">
                                        <span data-region="button-text">Charger plus</span>
                                        <span data-region="loading-icon-container" class="hidden"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                    </button>
                                </div>
                            </div>
                            <p class="hidden p-3 text-center" data-region="no-results-container">Aucun résultat</p>
                        </div>                    </div>
                    <div class="hidden" data-region="loading-placeholder">
                        <div class="text-center pt-3 icon-size-4"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</div>
                    </div>
                    <div class="p-3 text-center" data-region="empty-message-container">
                        <p>Rechercher des personnes et des messages</p>
                    </div>
                </div>                
                <div class="h-100 hidden bg-white" aria-hidden="true" data-region="view-settings">
                    <div class="hidden" data-region="content-container">
                        
                        <div data-region="settings" class="p-3">
                            <h3 class="h6 font-weight-bold">Confidentialité</h3>
                            <p>Vous pouvez choisir qui peut vous envoyer un message personnel</p>
                            <div data-preference="blocknoncontacts" class="mb-3">
                                <fieldset>
                                    <legend class="sr-only">Accepter des messages de :</legend>
                                        <div class="custom-control custom-radio mb-2">
                                            <input
                                                type="radio"
                                                name="message_blocknoncontacts"
                                                class="custom-control-input"
                                                id="block-noncontacts-618b70a0b704b618b70a0b3c6d45-1"
                                                value="1"
                                            >
                                            <label class="custom-control-label ml-2" for="block-noncontacts-618b70a0b704b618b70a0b3c6d45-1">
                                                Mes contacts seulement
                                            </label>
                                        </div>
                                        <div class="custom-control custom-radio mb-2">
                                            <input
                                                type="radio"
                                                name="message_blocknoncontacts"
                                                class="custom-control-input"
                                                id="block-noncontacts-618b70a0b704b618b70a0b3c6d45-0"
                                                value="0"
                                            >
                                            <label class="custom-control-label ml-2" for="block-noncontacts-618b70a0b704b618b70a0b3c6d45-0">
                                                Mes contacts et tout le monde dans mes cours
                                            </label>
                                        </div>
                                </fieldset>
                            </div>
                        
                            <div class="hidden" data-region="notification-preference-container">
                                <h3 class="mb-2 mt-4 h6 font-weight-bold">Préférences de notification</h3>
                            </div>
                        
                            <h3 class="mb-2 mt-4 h6 font-weight-bold">Général</h3>
                            <div data-preference="entertosend">
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="enter-to-send-618b70a0b704b618b70a0b3c6d45" >
                                    <label class="custom-control-label" for="enter-to-send-618b70a0b704b618b70a0b3c6d45">
                                        Taper entrée pour envoyer
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div data-region="placeholder-container">
                        
                        <div class="d-flex flex-column p-3">
                            <div class="w-25 bg-pulse-grey h6" style="height: 18px"></div>
                            <div class="w-75 bg-pulse-grey mb-4" style="height: 18px"></div>
                            <div class="mb-3">
                                <div class="w-100 d-flex mb-3">
                                    <div class="bg-pulse-grey rounded-circle" style="width: 18px; height: 18px"></div>
                                    <div class="bg-pulse-grey w-50 ml-2" style="height: 18px"></div>
                                </div>
                                <div class="w-100 d-flex mb-3">
                                    <div class="bg-pulse-grey rounded-circle" style="width: 18px; height: 18px"></div>
                                    <div class="bg-pulse-grey w-50 ml-2" style="height: 18px"></div>
                                </div>
                                <div class="w-100 d-flex mb-3">
                                    <div class="bg-pulse-grey rounded-circle" style="width: 18px; height: 18px"></div>
                                    <div class="bg-pulse-grey w-50 ml-2" style="height: 18px"></div>
                                </div>
                            </div>
                            <div class="w-50 bg-pulse-grey h6 mb-3 mt-2" style="height: 18px"></div>
                            <div class="mb-4">
                                <div class="w-100 d-flex mb-2 align-items-center">
                                    <div class="bg-pulse-grey w-25" style="width: 18px; height: 27px"></div>
                                    <div class="bg-pulse-grey w-25 ml-2" style="height: 18px"></div>
                                </div>
                                <div class="w-100 d-flex mb-2 align-items-center">
                                    <div class="bg-pulse-grey w-25" style="width: 18px; height: 27px"></div>
                                    <div class="bg-pulse-grey w-25 ml-2" style="height: 18px"></div>
                                </div>
                            </div>
                            <div class="w-25 bg-pulse-grey h6 mb-3 mt-2" style="height: 18px"></div>
                            <div class="mb-3">
                                <div class="w-100 d-flex mb-2 align-items-center">
                                    <div class="bg-pulse-grey w-25" style="width: 18px; height: 27px"></div>
                                    <div class="bg-pulse-grey w-50 ml-2" style="height: 18px"></div>
                                </div>
                            </div>
                        </div>                    </div>
                </div>            </div>
            <div class="footer-container position-relative" data-region="footer-container">
                
                <div
                    class="hidden border-top bg-white position-relative"
                    aria-hidden="true"
                    data-region="view-conversation"
                    data-enter-to-send="0"
                >
                    <div class="hidden p-sm-2" data-region="content-messages-footer-container">
                        
                            <div
                                class="emoji-auto-complete-container w-100 hidden"
                                data-region="emoji-auto-complete-container"
                                aria-live="polite"
                                aria-hidden="true"
                            >
                            </div>
                        <div class="d-flex mt-sm-1">
                            <textarea
                                dir="auto"
                                data-region="send-message-txt"
                                class="form-control bg-light"
                                rows="3"
                                data-auto-rows
                                data-min-rows="3"
                                data-max-rows="5"
                                aria-label="Écrire un message"
                                placeholder="Écrire un message"
                                style="resize: none"
                                maxlength="4096"
                            ></textarea>
                        
                            <div class="position-relative d-flex flex-column">
                                    <div
                                        data-region="emoji-picker-container"
                                        class="emoji-picker-container hidden"
                                        aria-hidden="true"
                                    >
                                        
                                        <div
                                            data-region="emoji-picker"
                                            class="card shadow emoji-picker"
                                        >
                                            <div class="card-header px-1 pt-1 pb-0 d-flex justify-content-between flex-shrink-0">
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button selected"
                                                    data-action="show-category"
                                                    data-category="Recent"
                                                    title="Récents"
                                                >
                                                    <i class="icon fa fa-clock-o fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Smileys & People"
                                                    title="Émoticônes & personnes"
                                                >
                                                    <i class="icon fa fa-smile-o fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Animals & Nature"
                                                    title="Animaux & nature"
                                                >
                                                    <i class="icon fa fa-leaf fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Food & Drink"
                                                    title="Nourriture & boissons"
                                                >
                                                    <i class="icon fa fa-cutlery fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Travel & Places"
                                                    title="Voyages & lieux"
                                                >
                                                    <i class="icon fa fa-plane fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Activities"
                                                    title="Activités"
                                                >
                                                    <i class="icon fa fa-futbol-o fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Objects"
                                                    title="Objets"
                                                >
                                                    <i class="icon fa fa-lightbulb-o fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Symbols"
                                                    title="Symboles"
                                                >
                                                    <i class="icon fa fa-heart fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                                <button
                                                    class="btn btn-outline-secondary icon-no-margin category-button"
                                                    data-action="show-category"
                                                    data-category="Flags"
                                                    title="Drapeaux"
                                                >
                                                    <i class="icon fa fa-flag fa-fw " aria-hidden="true"  ></i>
                                                </button>
                                            </div>
                                            <div class="card-body p-2 d-flex flex-column overflow-hidden">
                                                <div class="input-group mb-1 flex-shrink-0">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text pr-0 bg-white text-muted">
                                                            <i class="icon fa fa-search fa-fw " aria-hidden="true"  ></i>
                                                        </span>
                                                    </div>
                                                    <input
                                                        type="text"
                                                        class="form-control border-left-0"
                                                        placeholder="Rechercher"
                                                        aria-label="Rechercher"
                                                        data-region="search-input"
                                                    >
                                                </div>
                                                <div class="flex-grow-1 overflow-auto emojis-container h-100" data-region="emojis-container">
                                                    <div class="position-relative" data-region="row-container"></div>
                                                </div>
                                                <div class="flex-grow-1 overflow-auto search-results-container h-100 hidden" data-region="search-results-container">
                                                    <div class="position-relative" data-region="row-container"></div>
                                                </div>
                                            </div>
                                            <div
                                                class="card-footer d-flex flex-shrink-0"
                                                data-region="footer"
                                            >
                                                <div class="emoji-preview" data-region="emoji-preview"></div>
                                                <div data-region="emoji-short-name" class="emoji-short-name text-muted text-wrap ml-2"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <button
                                        class="btn btn-link btn-icon icon-size-3 ml-1"
                                        aria-label="Activer/désactiver le sélecteur d'émojis"
                                        data-action="toggle-emoji-picker"
                                    >
                                        <i class="icon fa fa-smile-o fa-fw " aria-hidden="true"  ></i>
                                    </button>
                                <button
                                    class="btn btn-link btn-icon icon-size-3 ml-1 mt-auto"
                                    aria-label="Envoyer message personnel"
                                    data-action="send-message"
                                >
                                    <span data-region="send-icon-container"><i class="icon fa fa-paper-plane fa-fw " aria-hidden="true"  ></i></span>
                                    <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="hidden p-sm-2" data-region="content-messages-footer-edit-mode-container">
                        
                        <div class="d-flex p-3 justify-content-end">
                            <button
                                class="btn btn-link btn-icon my-1 icon-size-4"
                                data-action="delete-selected-messages"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Supprimer les messages sélectionnés"
                            >
                                <span data-region="icon-container"><i class="icon fa fa-trash fa-fw " aria-hidden="true"  ></i></span>
                                <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                                <span class="sr-only">Supprimer les messages sélectionnés</span>
                            </button>
                        </div>                    </div>
                    <div class="hidden bg-secondary p-sm-3" data-region="content-messages-footer-require-contact-container">
                        
                        <div class="p-3 bg-white">
                            <p data-region="title"></p>
                            <p class="text-muted" data-region="text"></p>
                            <button type="button" class="btn btn-primary btn-block" data-action="request-add-contact">
                                <span data-region="dialogue-button-text">Envoyer une demande de contact</span>
                                <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                            </button>
                        </div>
                    </div>
                    <div class="hidden bg-secondary p-sm-3" data-region="content-messages-footer-require-unblock-container">
                        
                        <div class="p-3 bg-white">
                            <p class="text-muted" data-region="text">Vous avez bloqué cet utilisateur.</p>
                            <button type="button" class="btn btn-primary btn-block" data-action="request-unblock">
                                <span data-region="dialogue-button-text">Débloquer l'utilisateur</span>
                                <span class="hidden" data-region="loading-icon-container"><span class="loading-icon icon-no-margin"><i class="icon fa fa-circle-o-notch fa-spin fa-fw "  title="Chargement" aria-label="Chargement"></i></span>
</span>
                            </button>
                        </div>
                    </div>
                    <div class="hidden bg-secondary p-sm-3" data-region="content-messages-footer-unable-to-message">
                        
                        <div class="p-3 bg-white">
                            <p class="text-muted" data-region="text">Vous ne pouvez pas envoyer un message à cet utilisateur</p>
                        </div>
                    </div>
                    <div class="p-sm-2" data-region="placeholder-container">
                        <div class="d-flex">
                            <div class="bg-pulse-grey w-100" style="height: 80px"></div>
                            <div class="mx-2 mb-2 align-self-end bg-pulse-grey" style="height: 20px; width: 20px"></div>
                        </div>                    </div>
                    <div
                        class="hidden position-absolute z-index-1"
                        data-region="confirm-dialogue-container"
                        style="top: -1px; bottom: 0; right: 0; left: 0; background: rgba(0,0,0,0.3);"
                    ></div>
                </div>                    <div data-region="view-overview" class="text-center">
                        <a href="https://moodle-n7.inp-toulouse.fr/message/index.php">
                            Tout afficher
                        </a>
                    </div>
            </div>
        </div>

</div>
<footer id="page-footer" class="d-none d-lg-block">

<div id="course-footer"></div><div class="container blockplace1"><div class="row"></div></div>    <div class="container">
        <div class="row">
            <div class="col-12 pagination-centered socialicons">
                </div>
        </div>
    </div>
    <div class="info container2 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-4 my-md-0 my-2">
                    <div class="tool_usertours-resettourcontainer"></div>
    <p>Contact:</p>                </div>

                    <div class="col-md-4 my-md-0 my-2 helplink">
                        </div>
                        <div class="col-md-4 my-md-0 my-2">
                    <div class="tool_dataprivacy"><a href="https://moodle-n7.inp-toulouse.fr/admin/tool/dataprivacy/summary.php">Résumé de conservation de données</a></div><div class="policiesfooter"><a href="https://moodle-n7.inp-toulouse.fr/admin/tool/policy/viewall.php?returnurl=https%3A%2F%2Fmoodle-n7.inp-toulouse.fr%2Fmod%2Ffolder%2Fview.php%3Fid%3D49188">Politiques</a></div>                </div>
            </div>
        </div>
    </div>
    </footer>

<div id="back-to-top"><i class="fa fa-angle-up "></i></div>

</div></div><script>
//<![CDATA[
var require = {
    baseUrl : 'https://moodle-n7.inp-toulouse.fr/lib/requirejs.php/1633340554/',
    // We only support AMD modules with an explicit define() statement.
    enforceDefine: true,
    skipDataMain: true,
    waitSeconds : 0,

    paths: {
        jquery: 'https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/jquery/jquery-3.5.1.min',
        jqueryui: 'https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/jquery/ui-1.12.1/jquery-ui.min',
        jqueryprivate: 'https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/requirejs/jquery-private'
    },

    // Custom jquery config map.
    map: {
      // '*' means all modules will get 'jqueryprivate'
      // for their 'jquery' dependency.
      '*': { jquery: 'jqueryprivate' },
      // Stub module for 'process'. This is a workaround for a bug in MathJax (see MDL-60458).
      '*': { process: 'core/first' },

      // 'jquery-private' wants the real jQuery module
      // though. If this line was not here, there would
      // be an unresolvable cyclic dependency.
      jqueryprivate: { jquery: 'jquery' }
    }
};

//]]>
</script>
<script src="https://moodle-n7.inp-toulouse.fr/lib/javascript.php/1633340554/lib/requirejs/require.min.js"></script>
<script>
//<![CDATA[
M.util.js_pending("core/first");require(['core/first'], function() {
require(['core/prefetch']);
;
require(["media_videojs/loader"], function(loader) {
    loader.setUp(function(videojs) {
        videojs.options.flash.swf = "https://moodle-n7.inp-toulouse.fr/media/player/videojs/videojs/video-js.swf";
videojs.addLanguage('fr', {
  "Audio Player": "Lecteur audio",
  "Video Player": "Lecteur vidéo",
  "Play": "Lecture",
  "Pause": "Pause",
  "Replay": "Revoir",
  "Current Time": "Temps actuel",
  "Duration": "Durée",
  "Remaining Time": "Temps restant",
  "Stream Type": "Type de flux",
  "LIVE": "EN DIRECT",
  "Loaded": "Chargé",
  "Progress": "Progression",
  "Progress Bar": "Barre de progression",
  "progress bar timing: currentTime={1} duration={2}": "{1} de {2}",
  "Fullscreen": "Plein écran",
  "Non-Fullscreen": "Fenêtré",
  "Mute": "Sourdine",
  "Unmute": "Son activé",
  "Playback Rate": "Vitesse de lecture",
  "Subtitles": "Sous-titres",
  "subtitles off": "Sous-titres désactivés",
  "Captions": "Sous-titres transcrits",
  "captions off": "Sous-titres transcrits désactivés",
  "Chapters": "Chapitres",
  "Descriptions": "Descriptions",
  "descriptions off": "descriptions désactivées",
  "Audio Track": "Piste audio",
  "Volume Level": "Niveau de volume",
  "You aborted the media playback": "Vous avez interrompu la lecture de la vidéo.",
  "A network error caused the media download to fail part-way.": "Une erreur de réseau a interrompu le téléchargement de la vidéo.",
  "The media could not be loaded, either because the server or network failed or because the format is not supported.": "Cette vidéo n'a pas pu être chargée, soit parce que le serveur ou le réseau a échoué ou parce que le format n'est pas reconnu.",
  "The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "La lecture de la vidéo a été interrompue à cause d'un problème de corruption ou parce que la vidéo utilise des fonctionnalités non prises en charge par votre navigateur.",
  "No compatible source was found for this media.": "Aucune source compatible n'a été trouvée pour cette vidéo.",
  "The media is encrypted and we do not have the keys to decrypt it.": "Le média est chiffré et nous n'avons pas les clés pour le déchiffrer.",
  "Play Video": "Lire la vidéo",
  "Close": "Fermer",
  "Close Modal Dialog": "Fermer la boîte de dialogue modale",
  "Modal Window": "Fenêtre modale",
  "This is a modal window": "Ceci est une fenêtre modale",
  "This modal can be closed by pressing the Escape key or activating the close button.": "Ce modal peut être fermé en appuyant sur la touche Échap ou activer le bouton de fermeture.",
  ", opens captions settings dialog": ", ouvrir les paramètres des sous-titres transcrits",
  ", opens subtitles settings dialog": ", ouvrir les paramètres des sous-titres",
  ", opens descriptions settings dialog": ", ouvrir les paramètres des descriptions",
  ", selected": ", sélectionné",
  "captions settings": "Paramètres des sous-titres transcrits",
  "subtitles settings": "Paramètres des sous-titres",
  "descriptions settings": "Paramètres des descriptions",
  "Text": "Texte",
  "White": "Blanc",
  "Black": "Noir",
  "Red": "Rouge",
  "Green": "Vert",
  "Blue": "Bleu",
  "Yellow": "Jaune",
  "Magenta": "Magenta",
  "Cyan": "Cyan",
  "Background": "Arrière-plan",
  "Window": "Fenêtre",
  "Transparent": "Transparent",
  "Semi-Transparent": "Semi-transparent",
  "Opaque": "Opaque",
  "Font Size": "Taille des caractères",
  "Text Edge Style": "Style des contours du texte",
  "None": "Aucun",
  "Raised": "Élevé",
  "Depressed": "Enfoncé",
  "Uniform": "Uniforme",
  "Dropshadow": "Ombre portée",
  "Font Family": "Famille de polices",
  "Proportional Sans-Serif": "Polices à chasse variable sans empattement (Proportional Sans-Serif)",
  "Monospace Sans-Serif": "Polices à chasse fixe sans empattement (Monospace Sans-Serif)",
  "Proportional Serif": "Polices à chasse variable avec empattement (Proportional Serif)",
  "Monospace Serif": "Polices à chasse fixe avec empattement (Monospace Serif)",
  "Casual": "Manuscrite",
  "Script": "Scripte",
  "Small Caps": "Petites capitales",
  "Reset": "Réinitialiser",
  "restore all settings to the default values": "Restaurer tous les paramètres aux valeurs par défaut",
  "Done": "Terminé",
  "Caption Settings Dialog": "Boîte de dialogue des paramètres des sous-titres transcrits",
  "Beginning of dialog window. Escape will cancel and close the window.": "Début de la fenêtre de dialogue. La touche d'échappement annulera et fermera la fenêtre.",
  "End of dialog window.": "Fin de la fenêtre de dialogue."
});

    });
});;
M.util.js_pending('theme_adaptable/adaptable'); require(['theme_adaptable/adaptable'], function(amd) {amd.init(); M.util.js_complete('theme_adaptable/adaptable');});;
M.util.js_pending('theme_adaptable/bsoptions'); require(['theme_adaptable/bsoptions'], function(amd) {amd.init({"stickynavbar":true}); M.util.js_complete('theme_adaptable/bsoptions');});;
M.util.js_pending('theme_adaptable/drawer'); require(['theme_adaptable/drawer'], function(amd) {amd.init(); M.util.js_complete('theme_adaptable/drawer');});;
M.util.js_pending('block_settings/settingsblock'); require(['block_settings/settingsblock'], function(amd) {amd.init("10940", null); M.util.js_complete('block_settings/settingsblock');});;
M.util.js_pending('block_navigation/navblock'); require(['block_navigation/navblock'], function(amd) {amd.init("10939"); M.util.js_complete('block_navigation/navblock');});;
M.util.js_pending('theme_adaptable/zoomin'); require(['theme_adaptable/zoomin'], function(amd) {amd.init(); M.util.js_complete('theme_adaptable/zoomin');});;

require(['jquery', 'message_popup/notification_popover_controller'], function($, controller) {
    var container = $('#nav-notification-popover-container');
    var controller = new controller(container);
    controller.registerEventListeners();
    controller.registerListNavigationEventListeners();
});
;

require(
[
    'jquery',
    'core_message/message_popover'
],
function(
    $,
    Popover
) {
    var toggle = $('#message-drawer-toggle-618b70a0b6293618b70a0b3c6d41');
    Popover.init(toggle);
});
;

        require(['jquery', 'core/custom_interaction_events'], function($, CustomEvents) {
            CustomEvents.define('#jump-to-activity', [CustomEvents.events.accessibleChange]);
            $('#jump-to-activity').on(CustomEvents.events.accessibleChange, function() {
                if (!$(this).val()) {
                    return false;
                }
                $('#url_select_f618b70a0b3c6d42').submit();
            });
        });
    ;
M.util.js_pending('theme_adaptable/showsidebar'); require(['theme_adaptable/showsidebar'], function(amd) {amd.init(); M.util.js_complete('theme_adaptable/showsidebar');});;

require(['jquery', 'core_message/message_drawer', 'core_message/message_popover'], function($, MessageDrawer, Popover) {
    var root = $('#message-drawer-618b70a0b704b618b70a0b3c6d45');
    MessageDrawer.init(root);

    var toggle = $('#message-drawer-close-618b70a0b704b618b70a0b3c6d45');
    Popover.init(toggle);
});
;
M.util.js_pending('core/notification'); require(['core/notification'], function(amd) {amd.init(83797, [], true); M.util.js_complete('core/notification');});;
M.util.js_pending('core/log'); require(['core/log'], function(amd) {amd.setConfig({"level":"warn"}); M.util.js_complete('core/log');});;
M.util.js_pending('core/page_global'); require(['core/page_global'], function(amd) {amd.init(); M.util.js_complete('core/page_global');});M.util.js_complete("core/first");
});
//]]>
</script>
<script>
//<![CDATA[
M.yui.add_module({"mod_folder":{"name":"mod_folder","fullpath":"https:\/\/moodle-n7.inp-toulouse.fr\/lib\/javascript.php\/1633340554\/mod\/folder\/module.js","requires":[]}});

//]]>
</script>
<script>
//<![CDATA[
M.str = {"moodle":{"lastmodified":"Modifi\u00e9 le","name":"Nom","error":"Erreur","info":"Information","yes":"Oui","no":"Non","viewallcourses":"Afficher tous les cours","cancel":"Annuler","confirm":"Confirmer","areyousure":"En \u00eates-vous bien s\u00fbr\u00a0?","closebuttontitle":"Fermer","unknownerror":"Erreur inconnue","file":"Fichier","url":"URL"},"repository":{"type":"Type","size":"Taille","invalidjson":"Cha\u00eene JSON non valide","nofilesattached":"Aucun fichier joint","filepicker":"S\u00e9lecteur de fichiers","logout":"D\u00e9connexion","nofilesavailable":"Aucun fichier disponible","norepositoriesavailable":"D\u00e9sol\u00e9, aucun de vos d\u00e9p\u00f4ts actuels ne peut retourner de fichiers dans le format requis.","fileexistsdialogheader":"Le fichier existe","fileexistsdialog_editor":"Un fichier de ce nom a d\u00e9j\u00e0 \u00e9t\u00e9 joint au texte que vous modifiez.","fileexistsdialog_filemanager":"Un fichier de ce nom a d\u00e9j\u00e0 \u00e9t\u00e9 joint","renameto":"Renommer \u00e0 \u00ab\u00a0{$a}\u00a0\u00bb","referencesexist":"Il y a {$a} liens qui pointent vers ce fichier","select":"S\u00e9lectionnez"},"admin":{"confirmdeletecomments":"Voulez-vous vraiment supprimer des commentaires\u00a0?","confirmation":"Confirmation"},"debug":{"debuginfo":"Info de d\u00e9bogage","line":"Ligne","stacktrace":"Trace de la pile"},"langconfig":{"labelsep":"&nbsp;"}};
//]]>
</script>
<script>
//<![CDATA[
(function() {Y.use("moodle-filter_mathjaxloader-loader",function() {M.filter_mathjaxloader.configure({"mathjaxconfig":"\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n","lang":"fr"});
});
 M.util.js_pending('random618b70a0b3c6d1'); Y.on('domready', function() { var activities = document.querySelectorAll('.section-cm-edit-actions div[role="menu"]');
    if (activities) {
        for (var i = 0; i < activities.length; i++) {
            var ul = activities[i];
            var owner = ul.parentNode.parentNode.parentNode.getAttribute('data-owner');
            if (owner) {
                var id = owner.replace(/^#module-/, '');
                ul.insertAdjacentHTML('beforeend', "<a class=\"dropdown-item editing_notifications menu-action cm-edit-action\" data-action=\"notifications\" role=\"menuitem\" href=\"https:\/\/moodle-n7.inp-toulouse.fr\/local\/resourcenotif\/resourcenotif.php?id=123XYZ321\" title=\"Notifications\"><i class=\"icon fa fa-envelope-o fa-fw \"  title=\"Notifications\" aria-label=\"Notifications\"><\/i><span class=\"menu-action-text\">Notifications<\/span><\/a>".replace('123XYZ321', id));
            }
        }
    };  M.util.js_complete('random618b70a0b3c6d1'); });
 M.util.js_pending('random618b70a0b3c6d2'); Y.on('domready', function() { var activities = document.querySelectorAll('.section-cm-edit-actions ul[role="menu"]');
    if (activities) {
        for (var i = 0; i < activities.length; i++) {
            var ul = activities[i];
            var owner = ul.parentNode.getAttribute('data-owner');
            if (owner) {
                var id = owner.replace(/^#module-/, '');
                ul.insertAdjacentHTML('beforeend', "<li role=\"presentation\"><a class=\"dropdown-item editing_notifications menu-action cm-edit-action\" data-action=\"notifications\" role=\"menuitem\" href=\"https:\/\/moodle-n7.inp-toulouse.fr\/local\/resourcenotif\/resourcenotif.php?id=123XYZ321\" title=\"Notifications\"><i class=\"icon fa fa-envelope-o fa-fw \"  title=\"Notifications\" aria-label=\"Notifications\"><\/i><span class=\"menu-action-text\">Notifications<\/span><\/a><\/li>".replace('123XYZ321', id));
            }
        }
    };  M.util.js_complete('random618b70a0b3c6d2'); });
M.util.help_popups.setup(Y);
M.util.init_block_hider(Y, {"id":"inst10940","title":"Administration","preference":"block10940hidden","tooltipVisible":"Cacher le bloc Administration","tooltipHidden":"Montrer le bloc Administration"});
M.util.init_block_hider(Y, {"id":"inst10939","title":"Navigation","preference":"block10939hidden","tooltipVisible":"Cacher le bloc Navigation","tooltipHidden":"Montrer le bloc Navigation"});
 M.util.js_pending('random618b70a0b3c6d46'); Y.use('mod_folder', function(Y) { M.mod_folder.init_tree(Y, "folder_tree0", false);  M.util.js_complete('random618b70a0b3c6d46'); });
 M.util.js_pending('random618b70a0b3c6d48'); Y.on('domready', function() { M.util.js_complete("init");  M.util.js_complete('random618b70a0b3c6d48'); });
})();
//]]>
</script>
<script type="text/javascript">
    require(['theme_boost/loader']);
</script>
</body>
</html>
