<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- 
Template Name:  SmartAdmin Responsive WebApp - Template build with Twitter Bootstrap 4
Version: 4.5.1
Author: Sunnyat A.
Website: http://gootbootstrap.com
Purchase: https://wrapbootstrap.com/theme/smartadmin-responsive-webapp-WB0573SK0?ref=myorange
License: You must have a valid license purchased only from wrapbootstrap.com (link above) in order to legally use this theme for your project.
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>
            Scroller - Datatables - SmartAdmin v4.5.1
        </title>
        <meta name="description" content="Scroller">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
        <!-- Call App Mode on ios devices -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Remove Tap Highlight on Windows Phone IE -->
        <meta name="msapplication-tap-highlight" content="no">
        <!-- base css -->
        <link id="vendorsbundle" rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/vendors.bundle.css">
        <link id="appbundle" rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/app.bundle.css">
        <link id="mytheme" rel="stylesheet" media="screen, print" href="#">
        <link id="myskin" rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/skins/skin-master.css">
        <!-- Place favicon.ico in the root directory -->
        <link rel="apple-touch-icon" sizes="180x180" href="<%=request.getContextPath()%>/resources/template/img/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/resources/template/img/favicon/favicon-32x32.png">
        <link rel="mask-icon" href="<%=request.getContextPath()%>/resources/template/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/datagrid/datatables/datatables.bundle.css">
    </head>
    <!-- BEGIN Body -->
    <!-- Possible Classes

		* 'header-function-fixed'         - header is in a fixed at all times
		* 'nav-function-fixed'            - left panel is fixed
		* 'nav-function-minify'			  - skew nav to maximize space
		* 'nav-function-hidden'           - roll mouse on edge to reveal
		* 'nav-function-top'              - relocate left pane to top
		* 'mod-main-boxed'                - encapsulates to a container
		* 'nav-mobile-push'               - content pushed on menu reveal
		* 'nav-mobile-no-overlay'         - removes mesh on menu reveal
		* 'nav-mobile-slide-out'          - content overlaps menu
		* 'mod-bigger-font'               - content fonts are bigger for readability
		* 'mod-high-contrast'             - 4.5:1 text contrast ratio
		* 'mod-color-blind'               - color vision deficiency
		* 'mod-pace-custom'               - preloader will be inside content
		* 'mod-clean-page-bg'             - adds more whitespace
		* 'mod-hide-nav-icons'            - invisible navigation icons
		* 'mod-disable-animation'         - disables css based animations
		* 'mod-hide-info-card'            - hides info card from left panel
		* 'mod-lean-subheader'            - distinguished page header
		* 'mod-nav-link'                  - clear breakdown of nav links

		>>> more settings are described inside documentation page >>>
	-->
    <body class="mod-bg-1 mod-nav-link desktop chrome webkit pace-done blur"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
  <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>
        <!-- DOC: script to save and load page settings -->
        <script async="" src="https://www.google-analytics.com/analytics.js"></script><script>
            /**
             *	This script should be placed right after the body tag for fast execution 
             *	Note: the script is written in pure javascript and does not depend on thirdparty library
             **/
            'use strict';

            var classHolder = document.getElementsByTagName("BODY")[0],
                /** 
                 * Load from localstorage
                 **/
                themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
                {},
                themeURL = themeSettings.themeURL || '',
                themeOptions = themeSettings.themeOptions || '';
            /** 
             * Load theme options
             **/
            if (themeSettings.themeOptions)
            {
                classHolder.className = themeSettings.themeOptions;
                console.log("%c✔ Theme settings loaded", "color: #148f32");
            }
            else
            {
                console.log("%c✔ Heads up! Theme settings is empty or does not exist, loading default settings...", "color: #ed1c24");
            }
            if (themeSettings.themeURL && !document.getElementById('mytheme'))
            {
                var cssfile = document.createElement('link');
                cssfile.id = 'mytheme';
                cssfile.rel = 'stylesheet';
                cssfile.href = themeURL;
                document.getElementsByTagName('head')[0].appendChild(cssfile);

            }
            else if (themeSettings.themeURL && document.getElementById('mytheme'))
            {
                document.getElementById('mytheme').href = themeSettings.themeURL;
            }
            /** 
             * Save to localstorage 
             **/
            var saveSettings = function()
            {
                themeSettings.themeOptions = String(classHolder.className).split(/[^\w-]+/).filter(function(item)
                {
                    return /^(nav|header|footer|mod|display)-/i.test(item);
                }).join(' ');
                if (document.getElementById('mytheme'))
                {
                    themeSettings.themeURL = document.getElementById('mytheme').getAttribute("href");
                };
                localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
            }
            /** 
             * Reset settings
             **/
            var resetSettings = function()
            {
                localStorage.setItem("themeSettings", "");
            }

        </script>
        <!-- BEGIN Page Wrapper -->
        <div class="page-wrapper">
            <div class="page-inner">
                <!-- BEGIN Left Aside -->
                <aside class="page-sidebar">
                    <div class="page-logo">
                        <a href="#" class="page-logo-link press-scale-down d-flex align-items-center position-relative" data-toggle="modal" data-target="#modal-shortcut">
                            <img src="img/logo.png" alt="SmartAdmin WebApp" aria-roledescription="logo">
                            <span class="page-logo-text mr-1">SmartAdmin WebApp</span>
                            <span class="position-absolute text-white opacity-50 small pos-top pos-right mr-2 mt-n2"></span>
                            <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i>
                        </a>
                    </div>
                    <!-- BEGIN PRIMARY NAVIGATION -->
                    <nav id="js-primary-nav" class="primary-nav js-list-filter" role="navigation">
                        <div class="nav-filter">
                            <div class="position-relative">
                                <input type="text" id="nav_filter_input" placeholder="Filter menu" class="form-control" tabindex="0">
                                <a href="#" onclick="return false;" class="btn-primary btn-search-close js-waves-off" data-action="toggle" data-class="list-filter-active" data-target=".page-sidebar">
                                    <i class="fal fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="info-card">
                            <img src="img/demo/avatars/avatar-admin.png" class="profile-image rounded-circle" alt="Dr. Codex Lantern">
                            <div class="info-card-text">
                                <a href="#" class="d-flex align-items-center text-white">
                                    <span class="text-truncate text-truncate-sm d-inline-block">
                                        Dr. Codex Lantern
                                    </span>
                                </a>
                                <span class="d-inline-block text-truncate text-truncate-sm">Toronto, Canada</span>
                            </div>
                            <img src="img/card-backgrounds/cover-2-lg.png" class="cover" alt="cover">
                            <a href="#" onclick="return false;" class="pull-trigger-btn" data-action="toggle" data-class="list-filter-active" data-target=".page-sidebar" data-focus="nav_filter_input">
                                <i class="fal fa-angle-down"></i>
                            </a>
                        </div>
                        <ul id="js-nav-menu" class="nav-menu js-nav-built">
                            <li>
                                <a href="#" title="Application Intel" data-filter-tags="application intel" class=" waves-effect waves-themed">
                                    <i class="fal fa-info-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.application_intel">Application Intel</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="intel_analytics_dashboard.html" title="Analytics Dashboard" data-filter-tags="application intel analytics dashboard" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">Analytics Dashboard</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_marketing_dashboard.html" title="Marketing Dashboard" data-filter-tags="application intel marketing dashboard" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_marketing_dashboard">Marketing Dashboard</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_introduction.html" title="Introduction" data-filter-tags="application intel introduction" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_introduction">Introduction</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_privacy.html" title="Privacy" data-filter-tags="application intel privacy" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_privacy">Privacy</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Theme Settings" data-filter-tags="theme settings" class=" waves-effect waves-themed">
                                    <i class="fal fa-cog"></i>
                                    <span class="nav-link-text" data-i18n="nav.theme_settings">Theme Settings</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="settings_how_it_works.html" title="How it works" data-filter-tags="theme settings how it works" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_how_it_works">How it works</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_layout_options.html" title="Layout Options" data-filter-tags="theme settings layout options" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_layout_options">Layout Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_theme_modes.html" title="Theme Modes (beta)" data-filter-tags="theme settings theme modes (beta)" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_theme_modes_(beta)">Theme Modes (beta)</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_skin_options.html" title="Skin Options" data-filter-tags="theme settings skin options" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_skin_options">Skin Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_saving_db.html" title="Saving to Database" data-filter-tags="theme settings saving to database" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_saving_to_database">Saving to Database</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Documentation" data-filter-tags="documentation" class=" waves-effect waves-themed">
                                    <i class="fal fa-book"></i>
                                    <span class="nav-link-text" data-i18n="nav.documentation">Documentation</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="docs_general.html" title="General Docs" data-filter-tags="documentation general docs" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_general_docs">General Docs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_project_structure.html" title="Project Structure" data-filter-tags="documentation project structure" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_project_structure">Project Structure</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_flavors_editions.html" title="Flavors &amp; Editions" data-filter-tags="documentation flavors &amp; editions" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_flavors_&amp;_editions">Flavors &amp; Editions</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_community_support.html" title="Community Support" data-filter-tags="documentation community support" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_community_support">Community Support</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_premium_support.html" title="Premium Support" data-filter-tags="documentation premium support" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_premium_support">Premium Support</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_licensing.html" title="Licensing" data-filter-tags="documentation licensing" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_licensing">Licensing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_buildnotes.html" title="Build Notes" data-filter-tags="documentation build notes" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.documentation_build_notes">Build Notes</span>
                                            <span class="">v4.5.1</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Tools &amp; Components</li>
                            <li>
                                <a href="#" title="UI Components" data-filter-tags="ui components" class=" waves-effect waves-themed">
                                    <i class="fal fa-window"></i>
                                    <span class="nav-link-text" data-i18n="nav.ui_components">UI Components</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="ui_alerts.html" title="Alerts" data-filter-tags="ui components alerts" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_alerts">Alerts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_accordion.html" title="Accordions" data-filter-tags="ui components accordions" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_accordions">Accordions</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_badges.html" title="Badges" data-filter-tags="ui components badges" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_badges">Badges</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_breadcrumbs.html" title="Breadcrumbs" data-filter-tags="ui components breadcrumbs" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_breadcrumbs">Breadcrumbs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_buttons.html" title="Buttons" data-filter-tags="ui components buttons" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_buttons">Buttons</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_button_group.html" title="Button Group" data-filter-tags="ui components button group" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_button_group">Button Group</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_cards.html" title="Cards" data-filter-tags="ui components cards" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_cards">Cards</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_carousel.html" title="Carousel" data-filter-tags="ui components carousel" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_carousel">Carousel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_collapse.html" title="Collapse" data-filter-tags="ui components collapse" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_collapse">Collapse</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_dropdowns.html" title="Dropdowns" data-filter-tags="ui components dropdowns" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_dropdowns">Dropdowns</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_list_filter.html" title="List Filter" data-filter-tags="ui components list filter" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_list_filter">List Filter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_modal.html" title="Modal" data-filter-tags="ui components modal" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_modal">Modal</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_navbars.html" title="Navbars" data-filter-tags="ui components navbars" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_navbars">Navbars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_panels.html" title="Panels" data-filter-tags="ui components panels" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_panels">Panels</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_pagination.html" title="Pagination" data-filter-tags="ui components pagination" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_pagination">Pagination</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_popovers.html" title="Popovers" data-filter-tags="ui components popovers" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_popovers">Popovers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_progress_bars.html" title="Progress Bars" data-filter-tags="ui components progress bars" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_progress_bars">Progress Bars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_scrollspy.html" title="ScrollSpy" data-filter-tags="ui components scrollspy" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_scrollspy">ScrollSpy</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_side_panel.html" title="Side Panel" data-filter-tags="ui components side panel" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_side_panel">Side Panel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_spinners.html" title="Spinners" data-filter-tags="ui components spinners" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_spinners">Spinners</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tabs_pills.html" title="Tabs &amp; Pills" data-filter-tags="ui components tabs &amp; pills" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tabs_&amp;_pills">Tabs &amp; Pills</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_toasts.html" title="Toasts" data-filter-tags="ui components toasts" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_toasts">Toasts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tooltips.html" title="Tooltips" data-filter-tags="ui components tooltips" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tooltips">Tooltips</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Utilities" data-filter-tags="utilities" class=" waves-effect waves-themed">
                                    <i class="fal fa-bolt"></i>
                                    <span class="nav-link-text" data-i18n="nav.utilities">Utilities</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="utilities_borders.html" title="Borders" data-filter-tags="utilities borders" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_borders">Borders</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_clearfix.html" title="Clearfix" data-filter-tags="utilities clearfix" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_clearfix">Clearfix</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_color_pallet.html" title="Color Pallet" data-filter-tags="utilities color pallet" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_color_pallet">Color Pallet</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_display_property.html" title="Display Property" data-filter-tags="utilities display property" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_display_property">Display Property</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_fonts.html" title="Fonts" data-filter-tags="utilities fonts" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_fonts">Fonts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_flexbox.html" title="Flexbox" data-filter-tags="utilities flexbox" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_flexbox">Flexbox</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_helpers.html" title="Helpers" data-filter-tags="utilities helpers" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_helpers">Helpers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_position.html" title="Position" data-filter-tags="utilities position" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_position">Position</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_responsive_grid.html" title="Responsive Grid" data-filter-tags="utilities responsive grid" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_responsive_grid">Responsive Grid</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_sizing.html" title="Sizing" data-filter-tags="utilities sizing" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_sizing">Sizing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_spacing.html" title="Spacing" data-filter-tags="utilities spacing" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_spacing">Spacing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_typography.html" title="Typography" data-filter-tags="utilities typography fonts headings bold lead colors sizes link text states list styles truncate alignment" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_typography">Typography</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Menu child" data-filter-tags="utilities menu child" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_menu_child">Menu child</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="javascript:void(0);" title="Sublevel Item" data-filter-tags="utilities menu child sublevel item" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_sublevel_item">Sublevel Item</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);" title="Another Item" data-filter-tags="utilities menu child another item" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_another_item">Another Item</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:void(0);" title="Disabled item" data-filter-tags="utilities disabled item" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.utilities_disabled_item">Disabled item</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Font Icons" data-filter-tags="font icons" class=" waves-effect waves-themed">
                                    <i class="fal fa-map-marker-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.font_icons">Font Icons</span>
                                    <span class="dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top">7,500+</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="javascript:void(0);" title="FontAwesome" data-filter-tags="font icons fontawesome" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome">FontAwesome Pro</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="icons_fontawesome_light.html" title="Light" data-filter-tags="font icons fontawesome light" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_light">Light</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_regular.html" title="Regular" data-filter-tags="font icons fontawesome regular" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_regular">Regular</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_solid.html" title="Solid" data-filter-tags="font icons fontawesome solid" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_solid">Solid</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_duotone.html" title="Duotone" data-filter-tags="font icons fontawesome duotone" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_duotone">Duotone</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_brand.html" title="Brand" data-filter-tags="font icons fontawesome brand" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_brand">Brand</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="NextGen Icons" data-filter-tags="font icons nextgen icons" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons">NextGen Icons</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="icons_nextgen_general.html" title="General" data-filter-tags="font icons nextgen icons general" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_nextgen_base.html" title="Base" data-filter-tags="font icons nextgen icons base" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_base">Base</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Stack Icons" data-filter-tags="font icons stack icons" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons">Stack Icons</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="icons_stack_showcase.html" title="Showcase" data-filter-tags="font icons stack icons showcase" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_showcase">Showcase</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_stack_generate.html?layers=3" title="Generate Stack" data-filter-tags="font icons stack icons generate stack" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_generate_stack">Generate Stack</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Tables" data-filter-tags="tables" class=" waves-effect waves-themed">
                                    <i class="fal fa-th-list"></i>
                                    <span class="nav-link-text" data-i18n="nav.tables">Tables</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="tables_basic.html" title="Basic Tables" data-filter-tags="tables basic tables" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.tables_basic_tables">Basic Tables</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="tables_generate_style.html" title="Generate Table Style" data-filter-tags="tables generate table style" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.tables_generate_table_style">Generate Table Style</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Form Stuff" data-filter-tags="form stuff" class=" waves-effect waves-themed">
                                    <i class="fal fa-edit"></i>
                                    <span class="nav-link-text" data-i18n="nav.form_stuff">Form Stuff</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="form_basic_inputs.html" title="Basic Inputs" data-filter-tags="form stuff basic inputs" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_basic_inputs">Basic Inputs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_checkbox_radio.html" title="Checkbox &amp; Radio" data-filter-tags="form stuff checkbox &amp; radio" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_checkbox_&amp;_radio">Checkbox &amp; Radio</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_input_groups.html" title="Input Groups" data-filter-tags="form stuff input groups" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_input_groups">Input Groups</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_validation.html" title="Validation" data-filter-tags="form stuff validation" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_validation">Validation</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Plugins &amp; Addons</li>
                            <li>
                                <a href="#" title="Plugins" data-filter-tags="plugins" class=" waves-effect waves-themed">
                                    <i class="fal fa-shield-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.plugins">Core Plugins</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="plugins_faq.html" title="Plugins FAQ" data-filter-tags="plugins plugins faq" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_plugins_faq">Plugins FAQ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_waves.html" title="Waves" data-filter-tags="plugins waves" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_waves">Waves</span>
                                            <span class="dl-ref label bg-primary-400 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_pacejs.html" title="PaceJS" data-filter-tags="plugins pacejs" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_pacejs">PaceJS</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">13 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_smartpanels.html" title="SmartPanels" data-filter-tags="plugins smartpanels" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_smartpanels">SmartPanels</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_bootbox.html" title="BootBox" data-filter-tags="plugins bootbox alert sound" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_bootbox">BootBox</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">15 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_slimscroll.html" title="Slimscroll" data-filter-tags="plugins slimscroll" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_slimscroll">Slimscroll</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">5 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_throttle.html" title="Throttle" data-filter-tags="plugins throttle" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_throttle">Throttle</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">1 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_navigation.html" title="Navigation" data-filter-tags="plugins navigation" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_navigation">Navigation</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">2 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_i18next.html" title="i18next" data-filter-tags="plugins i18next" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_i18next">i18next</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">10 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_appcore.html" title="App.Core" data-filter-tags="plugins app.core" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.plugins_app.core">App.Core</span>
                                            <span class="dl-ref label bg-success-700 ml-2">14 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="active open">
                                <a href="#" title="Datatables" data-filter-tags="datatables datagrid" aria-expanded="true" class=" waves-effect waves-themed">
                                    <i class="fal fa-table"></i>
                                    <span class="nav-link-text" data-i18n="nav.datatables">Datatables</span>
                                    <span class="dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top">235 KB</span>
                                <b class="collapse-sign"><em class="fal fa-angle-up"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="datatables_basic.html" title="Basic" data-filter-tags="datatables datagrid basic" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_basic">Basic</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_autofill.html" title="Autofill" data-filter-tags="datatables datagrid autofill" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_autofill">Autofill</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_buttons.html" title="Buttons" data-filter-tags="datatables datagrid buttons" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_buttons">Buttons</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_export.html" title="Export" data-filter-tags="datatables datagrid export tables pdf excel print csv" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_export">Export</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_colreorder.html" title="ColReorder" data-filter-tags="datatables datagrid colreorder" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_colreorder">ColReorder</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_columnfilter.html" title="ColumnFilter" data-filter-tags="datatables datagrid columnfilter" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_columnfilter">ColumnFilter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_fixedcolumns.html" title="FixedColumns" data-filter-tags="datatables datagrid fixedcolumns" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_fixedcolumns">FixedColumns</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_fixedheader.html" title="FixedHeader" data-filter-tags="datatables datagrid fixedheader" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_fixedheader">FixedHeader</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_keytable.html" title="KeyTable" data-filter-tags="datatables datagrid keytable" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_keytable">KeyTable</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_responsive.html" title="Responsive" data-filter-tags="datatables datagrid responsive" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_responsive">Responsive</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_responsive_alt.html" title="Responsive Alt" data-filter-tags="datatables datagrid responsive alt" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_responsive_alt">Responsive Alt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_rowgroup.html" title="RowGroup" data-filter-tags="datatables datagrid rowgroup" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_rowgroup">RowGroup</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_rowreorder.html" title="RowReorder" data-filter-tags="datatables datagrid rowreorder" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_rowreorder">RowReorder</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="datatables_scroller.html" title="Scroller" data-filter-tags="datatables datagrid scroller" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_scroller">Scroller</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_select.html" title="Select" data-filter-tags="datatables datagrid select" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_select">Select</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_alteditor.html" title="AltEditor" data-filter-tags="datatables datagrid alteditor" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.datatables_alteditor">AltEditor</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Statistics" data-filter-tags="statistics chart graphs" class=" waves-effect waves-themed">
                                    <i class="fal fa-chart-pie"></i>
                                    <span class="nav-link-text" data-i18n="nav.statistics">Statistics</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="statistics_flot.html" title="Flot" data-filter-tags="statistics chart graphs flot bar pie" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_flot">Flot</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">36 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_chartjs.html" title="Chart.js" data-filter-tags="statistics chart graphs chart.js bar pie" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_chart.js">Chart.js</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">205 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_chartist.html" title="Chartist.js" data-filter-tags="statistics chart graphs chartist.js" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_chartist.js">Chartist.js</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">39 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_c3.html" title="C3 Charts" data-filter-tags="statistics chart graphs c3 charts" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_c3_charts">C3 Charts</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">197 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_peity.html" title="Peity" data-filter-tags="statistics chart graphs peity small" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_peity">Peity</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">4 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_sparkline.html" title="Sparkline" data-filter-tags="statistics chart graphs sparkline small tiny" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_sparkline">Sparkline</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">42 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_easypiechart.html" title="Easy Pie Chart" data-filter-tags="statistics chart graphs easy pie chart" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_easy_pie_chart">Easy Pie Chart</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">4 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_dygraph.html" title="Dygraph" data-filter-tags="statistics chart graphs dygraph complex" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.statistics_dygraph">Dygraph</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">120 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Notifications" data-filter-tags="notifications" class=" waves-effect waves-themed">
                                    <i class="fal fa-exclamation-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.notifications">Notifications</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="notifications_sweetalert2.html" title="SweetAlert2" data-filter-tags="notifications sweetalert2" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.notifications_sweetalert2">SweetAlert2</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">40 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="notifications_toastr.html" title="Toastr" data-filter-tags="notifications toastr" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.notifications_toastr">Toastr</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">5 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Form Plugins" data-filter-tags="form plugins" class=" waves-effect waves-themed">
                                    <i class="fal fa-credit-card-front"></i>
                                    <span class="nav-link-text" data-i18n="nav.form_plugins">Form Plugins</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="form_plugins_colorpicker.html" title="Color Picker" data-filter-tags="form plugins color picker" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_color_picker">Color Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_datepicker.html" title="Date Picker" data-filter-tags="form plugins date picker" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_date_picker">Date Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_daterange_picker.html" title="Date Range Picker" data-filter-tags="form plugins date range picker" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_date_range_picker">Date Range Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_dropzone.html" title="Dropzone" data-filter-tags="form plugins dropzone" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_dropzone">Dropzone</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_ionrangeslider.html" title="Ion.RangeSlider" data-filter-tags="form plugins ion.rangeslider" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_ion.rangeslider">Ion.RangeSlider</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_inputmask.html" title="Inputmask" data-filter-tags="form plugins inputmask" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_inputmask">Inputmask</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_imagecropper.html" title="Image Cropper" data-filter-tags="form plugins image cropper" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_image_cropper">Image Cropper</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_select2.html" title="Select2" data-filter-tags="form plugins select2" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_select2">Select2</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_summernote.html" title="Summernote" data-filter-tags="form plugins summernote texteditor editor" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_summernote">Summernote</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Miscellaneous" data-filter-tags="miscellaneous" class=" waves-effect waves-themed">
                                    <i class="fal fa-globe"></i>
                                    <span class="nav-link-text" data-i18n="nav.miscellaneous">Miscellaneous</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="miscellaneous_fullcalendar.html" title="FullCalendar" data-filter-tags="miscellaneous fullcalendar" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.miscellaneous_fullcalendar">FullCalendar</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="miscellaneous_lightgallery.html" title="Light Gallery" data-filter-tags="miscellaneous light gallery" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.miscellaneous_light_gallery">Light Gallery</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">61 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Layouts &amp; Apps</li>
                            <li>
                                <a href="#" title="Pages" data-filter-tags="pages" class=" waves-effect waves-themed">
                                    <i class="fal fa-plus-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.pages">Page Views</span>
                                <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                <ul>
                                    <li>
                                        <a href="page_chat.html" title="Chat" data-filter-tags="pages chat" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_chat">Chat</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_contacts.html" title="Contacts" data-filter-tags="pages contacts" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_contacts">Contacts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Forum" data-filter-tags="pages forum" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_forum">Forum</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="page_forum_list.html" title="List" data-filter-tags="pages forum list" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_list">List</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_threads.html" title="Threads" data-filter-tags="pages forum threads" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_threads">Threads</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_discussion.html" title="Discussion" data-filter-tags="pages forum discussion" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_discussion">Discussion</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Inbox" data-filter-tags="pages inbox" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_inbox">Inbox</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="page_inbox_general.html" title="General" data-filter-tags="pages inbox general" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_read.html" title="Read" data-filter-tags="pages inbox read" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_read">Read</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_write.html" title="Write" data-filter-tags="pages inbox write" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_write">Write</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_invoice.html" title="Invoice (printable)" data-filter-tags="pages invoice (printable)" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_invoice_(printable)">Invoice (printable)</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Authentication" data-filter-tags="pages authentication" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_authentication">Authentication</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="page_forget.html" title="Forget Password" data-filter-tags="pages authentication forget password" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_forget_password">Forget Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_locked.html" title="Locked Screen" data-filter-tags="pages authentication locked screen" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_locked_screen">Locked Screen</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login.html" title="Login" data-filter-tags="pages authentication login" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login">Login</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login_alt.html" title="Login Alt" data-filter-tags="pages authentication login alt" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login_alt">Login Alt</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_register.html" title="Register" data-filter-tags="pages authentication register" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_register">Register</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_confirmation.html" title="Confirmation" data-filter-tags="pages authentication confirmation" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_confirmation">Confirmation</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Error Pages" data-filter-tags="pages error pages" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_error_pages">Error Pages</span>
                                        <b class="collapse-sign"><em class="fal fa-angle-down"></em></b></a>
                                        <ul>
                                            <li>
                                                <a href="page_error.html" title="General Error" data-filter-tags="pages error pages general error" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_general_error">General Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_404.html" title="Server Error" data-filter-tags="pages error pages server error" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_server_error">Server Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_announced.html" title="Announced Error" data-filter-tags="pages error pages announced error" class=" waves-effect waves-themed">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_announced_error">Announced Error</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_profile.html" title="Profile" data-filter-tags="pages profile" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_profile">Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_projects.html" title="Projects" data-filter-tags="pages projects" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_projects">Projects</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_search.html" title="Search Results" data-filter-tags="pages search results" class=" waves-effect waves-themed">
                                            <span class="nav-link-text" data-i18n="nav.pages_search_results">Search Results</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="filter-message js-filter-message bg-success-600"></div>
                    </nav>
                    <!-- END PRIMARY NAVIGATION -->
                    <!-- NAV FOOTER -->
                    <div class="nav-footer shadow-top">
                        <a href="#" onclick="return false;" data-action="toggle" data-class="nav-function-minify" class="hidden-md-down">
                            <i class="ni ni-chevron-right"></i>
                            <i class="ni ni-chevron-right"></i>
                        </a>
                        <ul class="list-table m-auto nav-footer-buttons">
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="Chat logs">
                                    <i class="fal fa-comments"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="Support Chat">
                                    <i class="fal fa-life-ring"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="Make a call">
                                    <i class="fal fa-phone"></i>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- END NAV FOOTER -->
                </aside>
                <!-- END Left Aside -->
                <div class="page-content-wrapper">
                    <!-- BEGIN Page Header -->
                    <header class="page-header" role="banner">
                        <!-- we need this logo when user switches to nav-function-top -->
                        <div class="page-logo">
                            <a href="#" class="page-logo-link press-scale-down d-flex align-items-center position-relative" data-toggle="modal" data-target="#modal-shortcut">
                                <img src="img/logo.png" alt="SmartAdmin WebApp" aria-roledescription="logo">
                                <span class="page-logo-text mr-1">SmartAdmin WebApp</span>
                                <span class="position-absolute text-white opacity-50 small pos-top pos-right mr-2 mt-n2"></span>
                                <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i>
                            </a>
                        </div>
                        <!-- DOC: nav menu layout change shortcut -->
                        <div class="hidden-md-down dropdown-icon-menu position-relative">
                            <a href="#" class="header-btn btn js-waves-off" data-action="toggle" data-class="nav-function-hidden" title="Hide Navigation">
                                <i class="ni ni-menu"></i>
                            </a>
                            <ul>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-minify" title="Minify Navigation">
                                        <i class="ni ni-minify-nav"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-fixed" title="Lock Navigation">
                                        <i class="ni ni-lock-nav"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- DOC: mobile button appears during mobile width -->
                        <div class="hidden-lg-up">
                            <a href="#" class="header-btn btn press-scale-down waves-effect waves-themed" data-action="toggle" data-class="mobile-nav-on">
                                <i class="ni ni-menu"></i>
                            </a>
                        </div>
                        <div class="search">
                            <form class="app-forms hidden-xs-down" role="search" action="page_search.html" autocomplete="off">
                                <input type="text" id="search-field" placeholder="Search for anything" class="form-control" tabindex="1">
                                <a href="#" onclick="return false;" class="btn-danger btn-search-close js-waves-off d-none" data-action="toggle" data-class="mobile-search-on">
                                    <i class="fal fa-times"></i>
                                </a>
                            </form>
                        </div>
                        <div class="ml-auto d-flex">
                            <!-- activate app search icon (mobile) -->
                            <div class="hidden-sm-up">
                                <a href="#" class="header-icon" data-action="toggle" data-class="mobile-search-on" data-focus="search-field" title="Search">
                                    <i class="fal fa-search"></i>
                                </a>
                            </div>
                            <!-- app settings -->
                            <div class="hidden-md-down">
                                <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-settings">
                                    <i class="fal fa-cog"></i>
                                </a>
                            </div>
                            <!-- app shortcuts -->
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="My Apps">
                                    <i class="fal fa-cube"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated w-auto h-auto">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top">
                                        <h4 class="m-0 text-center color-white">
                                            Quick Shortcut
                                            <small class="mb-0 opacity-80">User Applications &amp; Addons</small>
                                        </h4>
                                    </div>
                                    <div class="custom-scroll h-100">
                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><ul class="app-list" style="overflow: hidden; width: auto; height: 100%;">
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-2 icon-stack-3x color-primary-600"></i>
                                                        <i class="base-3 icon-stack-2x color-primary-700"></i>
                                                        <i class="ni ni-settings icon-stack-1x text-white fs-lg"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Services
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-2 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-10 text-white icon-stack-1x"></i>
                                                        <i class="ni md-profile color-primary-800 icon-stack-2x"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Account
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-9 icon-stack-3x color-success-400"></i>
                                                        <i class="base-2 icon-stack-2x color-success-500"></i>
                                                        <i class="ni ni-shield icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Security
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-18 icon-stack-3x color-info-700"></i>
                                                        <span class="position-absolute pos-top pos-left pos-right color-white fs-md mt-2 fw-400">28</span>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Calendar
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-7 icon-stack-3x color-info-500"></i>
                                                        <i class="base-7 icon-stack-2x color-info-700"></i>
                                                        <i class="ni ni-graph icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Stats
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-danger-500"></i>
                                                        <i class="base-4 icon-stack-1x color-danger-400"></i>
                                                        <i class="ni ni-envelope icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Messages
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-fusion-400"></i>
                                                        <i class="base-5 icon-stack-2x color-fusion-200"></i>
                                                        <i class="base-5 icon-stack-1x color-fusion-100"></i>
                                                        <i class="fal fa-keyboard icon-stack-1x color-info-50"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Notes
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-16 icon-stack-3x color-fusion-500"></i>
                                                        <i class="base-10 icon-stack-1x color-primary-50 opacity-30"></i>
                                                        <i class="base-10 icon-stack-1x fs-xl color-primary-50 opacity-20"></i>
                                                        <i class="fal fa-dot-circle icon-stack-1x text-white opacity-85"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Photos
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-19 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-7 icon-stack-2x color-primary-300"></i>
                                                        <i class="base-7 icon-stack-1x fs-xxl color-primary-200"></i>
                                                        <i class="base-7 icon-stack-1x color-primary-500"></i>
                                                        <i class="fal fa-globe icon-stack-1x text-white opacity-85"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Maps
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-5 icon-stack-3x color-success-700 opacity-80"></i>
                                                        <i class="base-12 icon-stack-2x color-success-700 opacity-30"></i>
                                                        <i class="fal fa-comment-alt icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Chat
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-5 icon-stack-3x color-warning-600"></i>
                                                        <i class="base-7 icon-stack-2x color-warning-800 opacity-50"></i>
                                                        <i class="fal fa-phone icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Phone
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-6 icon-stack-3x color-danger-600"></i>
                                                        <i class="fal fa-chart-line icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Projects
                                                    </span>
                                                </a>
                                            </li>
                                            <li class="w-100">
                                                <a href="#" class="btn btn-default mt-4 mb-2 pr-5 pl-5 waves-effect waves-themed"> Add more apps </a>
                                            </li>
                                        </ul><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px; height: 237.798px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                                    </div>
                                </div>
                            </div>
                            <!-- app message -->
                            <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-messenger">
                                <i class="fal fa-globe"></i>
                                <span class="badge badge-icon">!</span>
                            </a>
                            <!-- app notification -->
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="You got 11 notifications">
                                    <i class="fal fa-bell"></i>
                                    <span class="badge badge-icon">11</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated dropdown-xl">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top mb-2">
                                        <h4 class="m-0 text-center color-white">
                                            11 New
                                            <small class="mb-0 opacity-80">User Notifications</small>
                                        </h4>
                                    </div>
                                    <ul class="nav nav-tabs nav-tabs-clean" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500 waves-effect waves-themed" data-toggle="tab" href="#tab-messages" data-i18n="drpdwn.messages">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500 waves-effect waves-themed" data-toggle="tab" href="#tab-feeds" data-i18n="drpdwn.feeds">Feeds</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500 waves-effect waves-themed" data-toggle="tab" href="#tab-events" data-i18n="drpdwn.events">Events</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content tab-notification">
                                        <div class="tab-pane active p-3 text-center">
                                            <h5 class="mt-4 pt-4 fw-500">
                                                <span class="d-block fa-3x pb-4 text-muted">
                                                    <i class="ni ni-arrow-up text-gradient opacity-70"></i>
                                                </span> Select a tab above to activate
                                                <small class="mt-3 fs-b fw-400 text-muted">
                                                    This blank page message helps protect your privacy, or you can show the first message here automatically through
                                                    <a href="#">settings page</a>
                                                </small>
                                            </h5>
                                        </div>
                                        <div class="tab-pane" id="tab-messages" role="tabpanel">
                                            <div class="custom-scroll h-100">
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><ul class="notification" style="overflow: hidden; width: auto; height: 100%;">
                                                    <li class="unread">
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-c.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Melissa Ayre <span class="badge badge-primary fw-n position-absolute pos-top pos-right mt-1">INBOX</span></span>
                                                                <span class="msg-a fs-sm">Re: New security codes</span>
                                                                <span class="msg-b fs-xs">Hello again and thanks for being part...</span>
                                                                <span class="fs-nano text-muted mt-1">56 seconds ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li class="unread">
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-a.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Adison Lee</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">2 minutes ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status status-success mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-b.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Oliver Kopyuv</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">3 days ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status status-warning mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-e.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Dr. John Cook PhD</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">2 weeks ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status status-success mr-2">
                                                                <!-- <img src="img/demo/avatars/avatar-m.png" data-src="img/demo/avatars/avatar-h.png" class="profile-image rounded-circle" alt="Sarah McBrook" /> -->
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-h.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Sarah McBrook</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">3 weeks ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status status-success mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-m.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Anothony Bezyeth</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">one month ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="d-flex align-items-center">
                                                            <span class="status status-danger mr-2">
                                                                <span class="profile-image rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-j.png')"></span>
                                                            </span>
                                                            <span class="d-flex flex-column flex-1 ml-1">
                                                                <span class="name">Lisa Hatchensen</span>
                                                                <span class="msg-a fs-sm">Msed quia non numquam eius</span>
                                                                <span class="fs-nano text-muted mt-1">one year ago</span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab-feeds" role="tabpanel">
                                            <div class="custom-scroll h-100">
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><ul class="notification" style="overflow: hidden; width: auto; height: 100%;">
                                                    <li class="unread">
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <span class="d-flex flex-column flex-1">
                                                                <span class="name d-flex align-items-center">Administrator <span class="badge badge-success fw-n ml-1">UPDATE</span></span>
                                                                <span class="msg-a fs-sm">
                                                                    System updated to version <strong>4.5.1</strong> <a href="docs_buildnotes.html">(patch notes)</a>
                                                                </span>
                                                                <span class="fs-nano text-muted mt-1">5 mins ago</span>
                                                            </span>
                                                            <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <div class="d-flex flex-column flex-1">
                                                                <span class="name">
                                                                    Adison Lee <span class="fw-300 d-inline">replied to your video <a href="#" class="fw-400"> Cancer Drug</a> </span>
                                                                </span>
                                                                <span class="msg-a fs-sm mt-2">Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day...</span>
                                                                <span class="fs-nano text-muted mt-1">10 minutes ago</span>
                                                            </div>
                                                            <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <!--<img src="img/demo/avatars/avatar-m.png" data-src="img/demo/avatars/avatar-k.png" class="profile-image rounded-circle" alt="k" />-->
                                                            <div class="d-flex flex-column flex-1">
                                                                <span class="name">
                                                                    Troy Norman'<span class="fw-300">s new connections</span>
                                                                </span>
                                                                <div class="fs-sm d-flex align-items-center mt-2">
                                                                    <span class="profile-image-md mr-1 rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-a.png'); background-size: cover;"></span>
                                                                    <span class="profile-image-md mr-1 rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
                                                                    <span class="profile-image-md mr-1 rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-c.png'); background-size: cover;"></span>
                                                                    <span class="profile-image-md mr-1 rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-e.png'); background-size: cover;"></span>
                                                                    <div data-hasmore="+3" class="rounded-circle profile-image-md mr-1">
                                                                        <span class="profile-image-md mr-1 rounded-circle d-inline-block" style="background-image:url('img/demo/avatars/avatar-h.png'); background-size: cover;"></span>
                                                                    </div>
                                                                </div>
                                                                <span class="fs-nano text-muted mt-1">55 minutes ago</span>
                                                            </div>
                                                            <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <!--<img src="img/demo/avatars/avatar-m.png" data-src="img/demo/avatars/avatar-e.png" class="profile-image-sm rounded-circle align-self-start mt-1" alt="k" />-->
                                                            <div class="d-flex flex-column flex-1">
                                                                <span class="name">Dr John Cook <span class="fw-300">sent a <span class="text-danger">new signal</span></span></span>
                                                                <span class="msg-a fs-sm mt-2">Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.</span>
                                                                <span class="fs-nano text-muted mt-1">10 minutes ago</span>
                                                            </div>
                                                            <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <div class="d-flex flex-column flex-1">
                                                                <span class="name">Lab Images <span class="fw-300">were updated!</span></span>
                                                                <div class="fs-sm d-flex align-items-center mt-1">
                                                                    <a href="#" class="mr-1 mt-1" title="Cell A-0012">
                                                                        <span class="d-block img-share" style="background-image:url('img/thumbs/pic-7.png'); background-size: cover;"></span>
                                                                    </a>
                                                                    <a href="#" class="mr-1 mt-1" title="Patient A-473 saliva">
                                                                        <span class="d-block img-share" style="background-image:url('img/thumbs/pic-8.png'); background-size: cover;"></span>
                                                                    </a>
                                                                    <a href="#" class="mr-1 mt-1" title="Patient A-473 blood cells">
                                                                        <span class="d-block img-share" style="background-image:url('img/thumbs/pic-11.png'); background-size: cover;"></span>
                                                                    </a>
                                                                    <a href="#" class="mr-1 mt-1" title="Patient A-473 Membrane O.C">
                                                                        <span class="d-block img-share" style="background-image:url('img/thumbs/pic-12.png'); background-size: cover;"></span>
                                                                    </a>
                                                                </div>
                                                                <span class="fs-nano text-muted mt-1">55 minutes ago</span>
                                                            </div>
                                                            <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex align-items-center show-child-on-hover">
                                                            <!--<img src="img/demo/avatars/avatar-m.png" data-src="img/demo/avatars/avatar-h.png" class="profile-image rounded-circle align-self-start mt-1" alt="k" />-->
                                                            <div class="d-flex flex-column flex-1">
                                                                <div class="name mb-2">
                                                                    Lisa Lamar<span class="fw-300"> updated project</span>
                                                                </div>
                                                                <div class="row fs-b fw-300">
                                                                    <div class="col text-left">
                                                                        Progress
                                                                    </div>
                                                                    <div class="col text-right fw-500">
                                                                        45%
                                                                    </div>
                                                                </div>
                                                                <div class="progress progress-sm d-flex mt-1">
                                                                    <span class="progress-bar bg-primary-500 progress-bar-striped" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></span>
                                                                </div>
                                                                <span class="fs-nano text-muted mt-1">2 hrs ago</span>
                                                                <div class="show-on-hover-parent position-absolute pos-right pos-bottom p-3">
                                                                    <a href="#" class="text-muted" title="delete"><i class="fal fa-trash-alt"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab-events" role="tabpanel">
                                            <div class="d-flex flex-column h-100">
                                                <div class="h-auto">
                                                    <table class="table table-bordered table-calendar m-0 w-100 h-100 border-0">
                                                        <tbody><tr>
                                                            <th colspan="7" class="pt-3 pb-2 pl-3 pr-3 text-center">
                                                                <div class="js-get-date h5 mb-2">Wednesday, October 26, 2022</div>
                                                            </th>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <th>Sun</th>
                                                            <th>Mon</th>
                                                            <th>Tue</th>
                                                            <th>Wed</th>
                                                            <th>Thu</th>
                                                            <th>Fri</th>
                                                            <th>Sat</th>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-muted bg-faded">30</td>
                                                            <td>1</td>
                                                            <td>2</td>
                                                            <td>3</td>
                                                            <td>4</td>
                                                            <td>5</td>
                                                            <td><i class="fal fa-birthday-cake mt-1 ml-1 position-absolute pos-left pos-top text-primary"></i> 6</td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>8</td>
                                                            <td>9</td>
                                                            <td class="bg-primary-300 pattern-0">10</td>
                                                            <td>11</td>
                                                            <td>12</td>
                                                            <td>13</td>
                                                        </tr>
                                                        <tr>
                                                            <td>14</td>
                                                            <td>15</td>
                                                            <td>16</td>
                                                            <td>17</td>
                                                            <td>18</td>
                                                            <td>19</td>
                                                            <td>20</td>
                                                        </tr>
                                                        <tr>
                                                            <td>21</td>
                                                            <td>22</td>
                                                            <td>23</td>
                                                            <td>24</td>
                                                            <td>25</td>
                                                            <td>26</td>
                                                            <td>27</td>
                                                        </tr>
                                                        <tr>
                                                            <td>28</td>
                                                            <td>29</td>
                                                            <td>30</td>
                                                            <td>31</td>
                                                            <td class="text-muted bg-faded">1</td>
                                                            <td class="text-muted bg-faded">2</td>
                                                            <td class="text-muted bg-faded">3</td>
                                                        </tr>
                                                    </tbody></table>
                                                </div>
                                                <div class="flex-1 custom-scroll">
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="p-2" style="overflow: hidden; width: auto; height: 100%;">
                                                        <div class="d-flex align-items-center text-left mb-3">
                                                            <div class="width-5 fw-300 text-primary l-h-n mr-1 align-self-start fs-xxl">
                                                                15
                                                            </div>
                                                            <div class="flex-1">
                                                                <div class="d-flex flex-column">
                                                                    <span class="l-h-n fs-md fw-500 opacity-70">
                                                                        October 2020
                                                                    </span>
                                                                    <span class="l-h-n fs-nano fw-400 text-secondary">
                                                                        Friday
                                                                    </span>
                                                                </div>
                                                                <div class="mt-3">
                                                                    <p>
                                                                        <strong>2:30PM</strong> - Doctor's appointment
                                                                    </p>
                                                                    <p>
                                                                        <strong>3:30PM</strong> - Report overview
                                                                    </p>
                                                                    <p>
                                                                        <strong>4:30PM</strong> - Meeting with Donnah V.
                                                                    </p>
                                                                    <p>
                                                                        <strong>5:30PM</strong> - Late Lunch
                                                                    </p>
                                                                    <p>
                                                                        <strong>6:30PM</strong> - Report Compression
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="py-2 px-3 bg-faded d-block rounded-bottom text-right border-faded border-bottom-0 border-right-0 border-left-0">
                                        <a href="#" class="fs-xs fw-500 ml-auto">view all notifications</a>
                                    </div>
                                </div>
                            </div>
                            <!-- app user menu -->
                            <div>
                                <a href="#" data-toggle="dropdown" title="drlantern@gotbootstrap.com" class="header-icon d-flex align-items-center justify-content-center ml-2">
                                    <img src="img/demo/avatars/avatar-admin.png" class="profile-image rounded-circle" alt="Dr. Codex Lantern">
                                    <!-- you can also add username next to the avatar with the codes below:
									<span class="ml-1 mr-1 text-truncate text-truncate-header hidden-xs-down">Me</span>
									<i class="ni ni-chevron-down hidden-xs-down"></i> -->
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated dropdown-lg">
                                    <div class="dropdown-header bg-trans-gradient d-flex flex-row py-4 rounded-top">
                                        <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                                            <span class="mr-2">
                                                <img src="img/demo/avatars/avatar-admin.png" class="rounded-circle profile-image" alt="Dr. Codex Lantern">
                                            </span>
                                            <div class="info-card-text">
                                                <div class="fs-lg text-truncate text-truncate-lg">Dr. Codex Lantern</div>
                                                <span class="text-truncate text-truncate-md opacity-80">drlantern@gotbootstrap.com</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                    <a href="#" class="dropdown-item" data-action="app-reset">
                                        <span data-i18n="drpdwn.reset_layout">Reset Layout</span>
                                    </a>
                                    <a href="#" class="dropdown-item" data-toggle="modal" data-target=".js-modal-settings">
                                        <span data-i18n="drpdwn.settings">Settings</span>
                                    </a>
                                    <div class="dropdown-divider m-0"></div>
                                    <a href="#" class="dropdown-item" data-action="app-fullscreen">
                                        <span data-i18n="drpdwn.fullscreen">Fullscreen</span>
                                        <i class="float-right text-muted fw-n">F11</i>
                                    </a>
                                    <a href="#" class="dropdown-item" data-action="app-print">
                                        <span data-i18n="drpdwn.print">Print</span>
                                        <i class="float-right text-muted fw-n">Ctrl + P</i>
                                    </a>
                                    <div class="dropdown-multilevel dropdown-multilevel-left">
                                        <div class="dropdown-item">
                                            Language
                                        </div>
                                        <div class="dropdown-menu">
                                            <a href="#?lang=fr" class="dropdown-item" data-action="lang" data-lang="fr">Français</a>
                                            <a href="#?lang=en" class="dropdown-item active" data-action="lang" data-lang="en">English (US)</a>
                                            <a href="#?lang=es" class="dropdown-item" data-action="lang" data-lang="es">Español</a>
                                            <a href="#?lang=ru" class="dropdown-item" data-action="lang" data-lang="ru">Русский язык</a>
                                            <a href="#?lang=jp" class="dropdown-item" data-action="lang" data-lang="jp">日本語</a>
                                            <a href="#?lang=ch" class="dropdown-item" data-action="lang" data-lang="ch">中文</a>
                                        </div>
                                    </div>
                                    <div class="dropdown-divider m-0"></div>
                                    <a class="dropdown-item fw-500 pt-3 pb-3" href="page_login.html">
                                        <span data-i18n="drpdwn.page-logout">Logout</span>
                                        <span class="float-right fw-n">@codexlantern</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- END Page Header -->
                    <!-- BEGIN Page Content -->
                    <!-- the #js-page-content id is needed for some plugins to initialize -->
                    <main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">SmartAdmin</a></li>
                            <li class="breadcrumb-item">Datatables</li>
                            <li class="breadcrumb-item active">Scroller</li>
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date">Wednesday, October 26, 2022</span></li>
                        </ol>
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class="subheader-icon fal fa-table"></i> DataTables: <span class="fw-300">Scroller</span> <sup class="badge badge-primary fw-500">ADDON</sup>
                                <small>
                                    Example of Scroller extention with server side processing
                                </small>
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Example <span class="fw-300"><i>Table</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel waves-effect waves-themed" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                          
                                            <!-- datatable start -->
                                            <div id="dt-basic-example_wrapper" class="dataTables_wrapper dt-bootstrap4 dts DTS"><div class="row mb-3"><div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-start"><div id="dt-basic-example_filter" class="dataTables_filter"><label><div class="input-group-text d-inline-flex width-3 align-items-center justify-content-center border-bottom-right-radius-0 border-top-right-radius-0 border-right-0"><i class="fal fa-search"></i></div><input type="search" class="form-control border-top-left-radius-0 border-bottom-left-radius-0 ml-0 width-lg shadow-inset-1" placeholder="Search" aria-controls="dt-basic-example"></label></div></div><div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end"><div class="dataTables_length" id="dt-basic-example_length"><label>Show <select name="dt-basic-example_length" aria-controls="dt-basic-example" class="form-control custom-select"><option value="10">10</option><option value="15">15</option><option value="25">25</option><option value="50">50</option><option value="100">100</option><option value="-1">All</option></select> entries</label></div></div></div><div class="row"><div class="col-sm-12"><div class="dataTables_scroll"><div class="dataTables_scrollHead" style="overflow: hidden; position: relative; border: 0px; width: 100%;"><div class="dataTables_scrollHeadInner" style="box-sizing: content-box; width: 1480px; padding-right: 17px;"><table class="table table-bordered table-hover table-striped w-100 dataTable" role="grid" style="margin-left: 0px; width: 1480px;"><thead>
                                                    <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 35.8594px;" aria-label="ID: activate to sort column descending" aria-sort="ascending">ID</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 185.562px;" aria-label="Client: activate to sort column ascending">Client</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 129.719px;" aria-label="Account#: activate to sort column ascending">Account#</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 376.094px;" aria-label="Office: activate to sort column ascending">Office</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 56.8281px;" aria-label="Age.: activate to sort column ascending">Age.</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 134.547px;" aria-label="Payment date: activate to sort column ascending">Payment date</th><th class="sorting" tabindex="0" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 159.406px;" aria-label="Transfer Amount: activate to sort column ascending">Transfer Amount</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 74.9844px;" aria-label="Actions">Actions</th></tr>
                                                </thead></table></div></div><div class="dataTables_scrollBody" style="position: relative; overflow: auto; max-height: 300px; width: 100%;"><table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100 dataTable dtr-inline" role="grid" aria-describedby="dt-basic-example_info" style="width: 100%; position: absolute; top: 0px; left: 0px;"><thead>
                                                    <tr role="row" style="height: 0px;"><th class="sorting_asc" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 35.8594px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="ID: activate to sort column descending" aria-sort="ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">ID</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 185.562px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Client: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Client</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 129.719px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Account#: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Account#</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 376.094px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Office: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Office</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 56.8281px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Age.: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Age.</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 134.547px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Payment date: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Payment date</div></th><th class="sorting" aria-controls="dt-basic-example" rowspan="1" colspan="1" style="width: 159.406px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Transfer Amount: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Transfer Amount</div></th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 74.9844px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Actions"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Actions</div></th></tr>
                                                </thead><tfoot>
                                                    <tr style="height: 0px;"><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 53.8594px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">ID</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 203.562px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Client</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 147.719px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Account#</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 394.094px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Office</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 74.8281px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Age.</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 152.547px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Payment date</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 177.406px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Transfer Amount</div></th><th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 74.9844px;"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;"></div></th></tr>
                                                </tfoot>
                                                
                                                
                                            <tbody><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">1</td><td>Palmer Delgado</td><td>1639082243299</td><td>Congo, the Democratic Republic of the</td><td>50</td><td>12-11-18</td><td>$01195.28</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">2</td><td>Galvin Kinney</td><td>1682081339899</td><td>Anguilla</td><td>65</td><td>12-08-19</td><td>$72906.21</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">3</td><td>Molly Rojas</td><td>1675010123199</td><td>Portugal</td><td>62</td><td>12-14-18</td><td>$32996.98</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">4</td><td>Baxter Carver</td><td>1656061898099</td><td>Macedonia</td><td>56</td><td>04-26-19</td><td>$00333.30</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">5</td><td>Keith Wiley</td><td>1646092989599</td><td>Belgium</td><td>59</td><td>04-01-20</td><td>$78156.99</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">6</td><td>Drew Talley</td><td>1627052284799</td><td>Hong Kong</td><td>36</td><td>01-07-20</td><td>$05779.43</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">7</td><td>Martena Ochoa</td><td>1619042405499</td><td>Thailand</td><td>53</td><td>08-30-19</td><td>$44856.57</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">8</td><td>Leah Coffey</td><td>1646032522299</td><td>Puerto Rico</td><td>60</td><td>12-18-18</td><td>$97913.06</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">9</td><td>Tucker Leach</td><td>1649121786999</td><td>Germany</td><td>58</td><td>02-21-19</td><td>$43017.65</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">10</td><td>Uma Jones</td><td>1662070845999</td><td>Hong Kong</td><td>57</td><td>05-26-18</td><td>$19379.32</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">11</td><td>Cedric Elliott</td><td>1635051137199</td><td>Palestine, State of</td><td>65</td><td>04-18-19</td><td>$35182.81</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">12</td><td>Tiger Sweet</td><td>1679090264399</td><td>Mozambique</td><td>64</td><td>09-23-18</td><td>$50832.12</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">13</td><td>Jaime Mcleod</td><td>1620080620599</td><td>Timor-Leste</td><td>33</td><td>08-02-19</td><td>$16053.91</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">14</td><td>Wyatt Moran</td><td>1697101429899</td><td>Switzerland</td><td>35</td><td>12-24-18</td><td>$81298.16</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">15</td><td>Miriam Russell</td><td>1621122039399</td><td>Turkey</td><td>54</td><td>09-04-19</td><td>$95837.09</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">16</td><td>Gay Meyers</td><td>1641100901099</td><td>Gambia</td><td>38</td><td>10-20-18</td><td>$03032.97</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">17</td><td>Russell Woodward</td><td>1616111237699</td><td>French Guiana</td><td>57</td><td>01-04-20</td><td>$81858.70</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">18</td><td>Fuller Martin</td><td>1661110928299</td><td>Palau</td><td>46</td><td>06-21-19</td><td>$69182.28</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">19</td><td>Carl Gomez</td><td>1688021354499</td><td>Estonia</td><td>44</td><td>08-09-19</td><td>$18071.08</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">20</td><td>Clare Daniels</td><td>1616032103499</td><td>Canada</td><td>31</td><td>11-07-19</td><td>$42818.42</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">21</td><td>Ahmed Vance</td><td>1679060506799</td><td>Iceland</td><td>40</td><td>05-29-19</td><td>$41129.00</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">22</td><td>Geoffrey Peters</td><td>1618012579299</td><td>South Africa</td><td>48</td><td>10-29-19</td><td>$90293.53</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">23</td><td>Tarik Lang</td><td>1666010903199</td><td>Kuwait</td><td>38</td><td>07-14-18</td><td>$34731.84</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">24</td><td>Jameson Maxwell</td><td>1613012630999</td><td>Iran</td><td>61</td><td>05-26-19</td><td>$65499.43</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">25</td><td>Urielle Mcclain</td><td>1650110467899</td><td>Panama</td><td>51</td><td>09-04-19</td><td>$64466.75</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">26</td><td>Florence Stokes</td><td>1651011679799</td><td>Virgin Islands, United States</td><td>41</td><td>08-29-19</td><td>$21745.77</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">27</td><td>Genevieve Cobb</td><td>1603111704099</td><td>Kiribati</td><td>35</td><td>12-19-18</td><td>$98281.51</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">28</td><td>Kylynn Mcgowan</td><td>1689032173799</td><td>Malta</td><td>39</td><td>05-04-18</td><td>$92741.11</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">29</td><td>Hyatt Goodwin</td><td>1615100876099</td><td>Faroe Islands</td><td>47</td><td>09-02-19</td><td>$06598.84</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">30</td><td>Jerome Rosa</td><td>1603060395499</td><td>Luxembourg</td><td>43</td><td>05-12-18</td><td>$34627.15</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">31</td><td>Marshall Ramos</td><td>1660081433299</td><td>French Southern Territories</td><td>44</td><td>06-02-18</td><td>$38380.96</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">32</td><td>Tanisha Glover</td><td>1635122975199</td><td>Western Sahara</td><td>31</td><td>07-08-18</td><td>$19106.20</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">33</td><td>Willa Foster</td><td>1678082036699</td><td>Namibia</td><td>52</td><td>10-08-18</td><td>$83592.58</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">34</td><td>Caleb Martinez</td><td>1682081274099</td><td>Somalia</td><td>37</td><td>12-12-18</td><td>$75846.45</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">35</td><td>Brock Sheppard</td><td>1603103039499</td><td>South Africa</td><td>58</td><td>02-08-20</td><td>$16432.50</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">36</td><td>MacKensie Mccray</td><td>1600082110199</td><td>New Zealand</td><td>36</td><td>02-13-19</td><td>$28596.89</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">37</td><td>Raya Shelton</td><td>1630061958299</td><td>United Kingdom (Great Britain)</td><td>51</td><td>03-15-19</td><td>$39624.45</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">38</td><td>Fatima Vance</td><td>1637092513799</td><td>San Marino</td><td>29</td><td>08-31-19</td><td>$11601.45</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">39</td><td>Amaya Cole</td><td>1618050741699</td><td>Sint Maarten</td><td>28</td><td>01-27-20</td><td>$57575.75</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">40</td><td>Michael Burton</td><td>1690062625399</td><td>Singapore</td><td>45</td><td>09-02-19</td><td>$87742.93</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">41</td><td>Lucas Prince</td><td>1667053072299</td><td>Belarus</td><td>39</td><td>09-03-19</td><td>$05452.82</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">42</td><td>Graham Marks</td><td>1620050127699</td><td>Bermuda</td><td>61</td><td>10-04-19</td><td>$12081.39</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">43</td><td>Grant Black</td><td>1693091822199</td><td>Belgium</td><td>64</td><td>08-20-19</td><td>$49108.73</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">44</td><td>Holmes Maldonado</td><td>1600112120599</td><td>Åland Islands</td><td>55</td><td>02-09-20</td><td>$24202.95</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">45</td><td>Karyn Snider</td><td>1667072136499</td><td>Burkina Faso</td><td>29</td><td>05-21-18</td><td>$03641.01</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">46</td><td>Keaton Mcconnell</td><td>1601030890299</td><td>Guernsey</td><td>29</td><td>08-04-18</td><td>$56002.58</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">47</td><td>Jasper Petty</td><td>1668062510799</td><td>Zambia</td><td>54</td><td>09-20-18</td><td>$80465.73</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">48</td><td>Carlos Delgado</td><td>1600021710899</td><td>American Samoa</td><td>43</td><td>08-25-18</td><td>$18365.71</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">49</td><td>Hilda Guy</td><td>1662071742799</td><td>Nepal</td><td>60</td><td>05-21-19</td><td>$32019.20</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">50</td><td>Heidi Cotton</td><td>1692072676699</td><td>Saint Vincent and The Grenadines</td><td>38</td><td>01-13-19</td><td>$39509.21</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">51</td><td>Erasmus Stephenson</td><td>1607011298799</td><td>Sierra Leone</td><td>43</td><td>12-25-18</td><td>$77975.88</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">52</td><td>Inga Gamble</td><td>1616090119599</td><td>Eritrea</td><td>37</td><td>04-11-20</td><td>$99737.90</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="odd"><td class="dtr-control sorting_1" tabindex="0">53</td><td>Elvis Reyes</td><td>1611112236299</td><td>Malta</td><td>63</td><td>08-18-18</td><td>$13280.93</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr><tr role="row" class="even"><td class="dtr-control sorting_1" tabindex="0">54</td><td>Emily Conrad</td><td>1606022979299</td><td>Tonga</td><td>36</td><td>11-16-19</td><td>$78216.47</td><td>
						<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1" title="Delete Record">
							<i class="fal fa-times"></i>
						</a>
						<div class="dropdown d-inline-block">
							<a href="#" '="" class="btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0" data-toggle="dropdown" aria-expanded="true" title="More options">
								<i class="fal fa-ellipsis-v"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="javascript:void(0);">Change Status</a>
								<a class="dropdown-item" href="javascript:void(0);">Generate Report</a>
							</div>
						</div></td></tr></tbody></table><div style="position: relative; top: 0px; left: 0px; width: 1px; height: 127500px;"></div><div class="dts_label" style="top: 0px; display: none;">1</div></div><div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 1480px; padding-right: 17px;"><table class="table table-bordered table-hover table-striped w-100 dataTable" role="grid" style="margin-left: 0px; width: 1480px;"><tfoot>
                                                    <tr><th rowspan="1" colspan="1" style="width: 53.8594px;">ID</th><th rowspan="1" colspan="1" style="width: 203.562px;">Client</th><th rowspan="1" colspan="1" style="width: 147.719px;">Account#</th><th rowspan="1" colspan="1" style="width: 394.094px;">Office</th><th rowspan="1" colspan="1" style="width: 74.8281px;">Age.</th><th rowspan="1" colspan="1" style="width: 152.547px;">Payment date</th><th rowspan="1" colspan="1" style="width: 177.406px;">Transfer Amount</th><th rowspan="1" colspan="1" style="width: 74.9844px;"></th></tr>
                                                </tfoot></table></div></div></div><div id="dt-basic-example_processing" class="dataTables_processing card" style="display: none;"><div class="d-flex align-items-center justify-content-center fs-lg"><div class="spinner-border spinner-border-sm text-primary mr-2" role="status"><span class="sr-only"> Loading...</span></div> Processing...</div></div></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dt-basic-example_info" role="status" aria-live="polite">Showing 1 to 6 of 2,500 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="dt-basic-example_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="dt-basic-example_previous"><a href="#" aria-controls="dt-basic-example" data-dt-idx="0" tabindex="0" class="page-link"><i class="fal fa-chevron-left"></i></a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dt-basic-example" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dt-basic-example" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dt-basic-example" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dt-basic-example" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dt-basic-example" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item disabled" id="dt-basic-example_ellipsis"><a href="#" aria-controls="dt-basic-example" data-dt-idx="6" tabindex="0" class="page-link">…</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dt-basic-example" data-dt-idx="7" tabindex="0" class="page-link">47</a></li><li class="paginate_button page-item next" id="dt-basic-example_next"><a href="#" aria-controls="dt-basic-example" data-dt-idx="8" tabindex="0" class="page-link"><i class="fal fa-chevron-right"></i></a></li></ul></div></div></div></div>
                                            <!-- datatable end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                    <!-- this overlay is activated only when mobile menu is triggered -->
                    <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div> <!-- END Page Content -->
                    <!-- BEGIN Page Footer -->
                    <footer class="page-footer" role="contentinfo">
                        <div class="d-flex align-items-center flex-1 text-muted">
                            <span class="hidden-md-down fw-700">2020 © SmartAdmin by&nbsp;<a href="https://www.gotbootstrap.com" class="text-primary fw-500" title="gotbootstrap.com" target="_blank">gotbootstrap.com</a></span>
                        </div>
                        <div>
                            <ul class="list-table m-0">
                                <li><a href="intel_introduction.html" class="text-secondary fw-700">About</a></li>
                                <li class="pl-3"><a href="info_app_licensing.html" class="text-secondary fw-700">License</a></li>
                                <li class="pl-3"><a href="info_app_docs.html" class="text-secondary fw-700">Documentation</a></li>
                                <li class="pl-3 fs-xl"><a href="https://wrapbootstrap.com/user/MyOrange" class="text-secondary" target="_blank"><i class="fal fa-question-circle" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </footer>
                    <!-- END Page Footer -->
                    <!-- BEGIN Shortcuts -->
                    <div class="modal fade modal-backdrop-transparent" id="modal-shortcut" tabindex="-1" role="dialog" aria-labelledby="modal-shortcut" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-top modal-transparent" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <ul class="app-list w-auto h-auto p-0 text-left">
                                        <li>
                                            <a href="intel_introduction.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-3x opacity-100 color-primary-500 "></i>
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-primary-300 "></i>
                                                    <i class="fal fa-home icon-stack-1x opacity-100 color-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Home
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="page_inbox_general.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-3x opacity-100 color-success-500 "></i>
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-success-300 "></i>
                                                    <i class="ni ni-envelope icon-stack-1x text-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Inbox
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="intel_introduction.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-primary-300 "></i>
                                                    <i class="fal fa-plus icon-stack-1x opacity-100 color-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Add More
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END Shortcuts -->
                    <!-- BEGIN Color profile -->
                    <!-- this area is hidden and will not be seen on screens or screen readers -->
                    <!-- we use this only for CSS color refernce for JS stuff -->
                    <p id="js-color-profile" class="d-none">
                        <span class="color-primary-50"></span>
                        <span class="color-primary-100"></span>
                        <span class="color-primary-200"></span>
                        <span class="color-primary-300"></span>
                        <span class="color-primary-400"></span>
                        <span class="color-primary-500"></span>
                        <span class="color-primary-600"></span>
                        <span class="color-primary-700"></span>
                        <span class="color-primary-800"></span>
                        <span class="color-primary-900"></span>
                        <span class="color-info-50"></span>
                        <span class="color-info-100"></span>
                        <span class="color-info-200"></span>
                        <span class="color-info-300"></span>
                        <span class="color-info-400"></span>
                        <span class="color-info-500"></span>
                        <span class="color-info-600"></span>
                        <span class="color-info-700"></span>
                        <span class="color-info-800"></span>
                        <span class="color-info-900"></span>
                        <span class="color-danger-50"></span>
                        <span class="color-danger-100"></span>
                        <span class="color-danger-200"></span>
                        <span class="color-danger-300"></span>
                        <span class="color-danger-400"></span>
                        <span class="color-danger-500"></span>
                        <span class="color-danger-600"></span>
                        <span class="color-danger-700"></span>
                        <span class="color-danger-800"></span>
                        <span class="color-danger-900"></span>
                        <span class="color-warning-50"></span>
                        <span class="color-warning-100"></span>
                        <span class="color-warning-200"></span>
                        <span class="color-warning-300"></span>
                        <span class="color-warning-400"></span>
                        <span class="color-warning-500"></span>
                        <span class="color-warning-600"></span>
                        <span class="color-warning-700"></span>
                        <span class="color-warning-800"></span>
                        <span class="color-warning-900"></span>
                        <span class="color-success-50"></span>
                        <span class="color-success-100"></span>
                        <span class="color-success-200"></span>
                        <span class="color-success-300"></span>
                        <span class="color-success-400"></span>
                        <span class="color-success-500"></span>
                        <span class="color-success-600"></span>
                        <span class="color-success-700"></span>
                        <span class="color-success-800"></span>
                        <span class="color-success-900"></span>
                        <span class="color-fusion-50"></span>
                        <span class="color-fusion-100"></span>
                        <span class="color-fusion-200"></span>
                        <span class="color-fusion-300"></span>
                        <span class="color-fusion-400"></span>
                        <span class="color-fusion-500"></span>
                        <span class="color-fusion-600"></span>
                        <span class="color-fusion-700"></span>
                        <span class="color-fusion-800"></span>
                        <span class="color-fusion-900"></span>
                    </p>
                    <!-- END Color profile -->
                </div>
            </div>
        </div>
        <!-- END Page Wrapper -->
        <!-- BEGIN Quick Menu -->
        <!-- to add more items, please make sure to change the variable '$menu-items: number;' in your _page-components-shortcut.scss -->
        <nav class="shortcut-menu d-none d-sm-block">
            <input type="checkbox" class="menu-open" name="menu-open" id="menu_open">
            <label for="menu_open" class="menu-open-button ">
                <span class="app-shortcut-icon d-block"></span>
            </label>
            <a href="#" class="menu-item btn waves-effect waves-themed" data-toggle="tooltip" data-placement="left" title="" data-original-title="Scroll Top">
                <i class="fal fa-arrow-up"></i>
            </a>
            <a href="page_login.html" class="menu-item btn waves-effect waves-themed" data-toggle="tooltip" data-placement="left" title="" data-original-title="Logout">
                <i class="fal fa-sign-out"></i>
            </a>
            <a href="#" class="menu-item btn waves-effect waves-themed" data-action="app-fullscreen" data-toggle="tooltip" data-placement="left" title="" data-original-title="Full Screen">
                <i class="fal fa-expand"></i>
            </a>
            <a href="#" class="menu-item btn waves-effect waves-themed" data-action="app-print" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print page">
                <i class="fal fa-print"></i>
            </a>
            <a href="#" class="menu-item btn waves-effect waves-themed" data-action="app-voice" data-toggle="tooltip" data-placement="left" title="" data-original-title="Voice command">
                <i class="fal fa-microphone"></i>
            </a>
        </nav>
        <!-- END Quick Menu -->
        <!-- BEGIN Messenger -->
        <div class="modal fade js-modal-messenger modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-right">
                <div class="modal-content h-100">
                    <div class="dropdown-header bg-trans-gradient d-flex align-items-center w-100">
                        <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                            <span class="mr-2">
                                <span class="rounded-circle profile-image d-block" style="background-image:url('img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                            </span>
                            <div class="info-card-text">
                                <a href="javascript:void(0);" class="fs-lg text-truncate text-truncate-lg text-white" data-toggle="dropdown" aria-expanded="false">
                                    Tracey Chang
                                    <i class="fal fa-angle-down d-inline-block ml-1 text-white fs-md"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Send Email</a>
                                    <a class="dropdown-item" href="#">Create Appointment</a>
                                    <a class="dropdown-item" href="#">Block User</a>
                                </div>
                                <span class="text-truncate text-truncate-md opacity-80">IT Director</span>
                            </div>
                        </div>
                        <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                    </div>
                    <div class="modal-body p-0 h-100 d-flex">
                        <!-- BEGIN msgr-list -->
                        <div class="msgr-list d-flex flex-column bg-faded border-faded border-top-0 border-right-0 border-bottom-0 position-absolute pos-top pos-bottom">
                            <div>
                                <div class="height-4 width-3 h3 m-0 d-flex justify-content-center flex-column color-primary-500 pl-3 mt-2">
                                    <i class="fal fa-search"></i>
                                </div>
                                <input type="text" class="form-control bg-white" id="msgr_listfilter_input" placeholder="Filter contacts" aria-label="FriendSearch" data-listfilter="#js-msgr-listfilter">
                            </div>
                            <div class="flex-1 h-100 custom-scroll">
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="w-100" style="overflow: hidden; width: auto; height: 100%;">
                                    <ul id="js-msgr-listfilter" class="list-unstyled m-0 js-list-filter">
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="tracey chang online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Tracey Chang
                                                        <small class="d-block font-italic text-success fs-xs">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="oliver kopyuv online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Oliver Kopyuv
                                                        <small class="d-block font-italic text-success fs-xs">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="dr john cook phd away">
                                                <div class="d-table-cell align-middle status status-warning status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-e.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Dr. John Cook PhD
                                                        <small class="d-block font-italic fs-xs">
                                                            Away
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-g.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Ali Amdaney
                                                        <small class="d-block font-italic fs-xs text-success">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="sarah mcbrook online">
                                                <div class="d-table-cell align-middle status status-success status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-h.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Sarah McBrook
                                                        <small class="d-block font-italic fs-xs text-success">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney offline">
                                                <div class="d-table-cell align-middle status status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-a.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs">
                                                            Offline
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney busy">
                                                <div class="d-table-cell align-middle status status-danger status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-j.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs text-danger">
                                                            Busy
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney offline">
                                                <div class="d-table-cell align-middle status status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-c.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs">
                                                            Offline
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney inactive">
                                                <div class="d-table-cell align-middle">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('img/demo/avatars/avatar-m.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        +714651347790
                                                        <small class="d-block font-italic fs-xs opacity-50">
                                                            Missed Call
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="filter-message js-filter-message"></div>
                                </div><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                            </div>
                            <div>
                                <a class="fs-xl d-flex align-items-center p-3">
                                    <i class="fal fa-cogs"></i>
                                </a>
                            </div>
                        </div>
                        <!-- END msgr-list -->
                        <!-- BEGIN msgr -->
                        <div class="msgr d-flex h-100 flex-column bg-white">
                            <!-- BEGIN custom-scroll -->
                            <div class="custom-scroll flex-1 h-100">
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div id="chat_container" class="w-100 p-4" style="overflow: hidden; width: auto; height: 100%;">
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment">
                                        <div class="time-stamp text-center mb-2 fw-400">
                                            Jun 19
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent">
                                        <div class="chat-message">
                                            <p>
                                                Hey Tracey, did you get my files?
                                            </p>
                                        </div>
                                        <div class="text-right fw-300 text-muted mt-1 fs-xs">
                                            3:00 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get">
                                        <div class="chat-message">
                                            <p>
                                                Hi
                                            </p>
                                            <p>
                                                Sorry going through a busy time in office. Yes I analyzed the solution.
                                            </p>
                                            <p>
                                                It will require some resource, which I could not manage.
                                            </p>
                                        </div>
                                        <div class="fw-300 text-muted mt-1 fs-xs">
                                            3:24 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent chat-start">
                                        <div class="chat-message">
                                            <p>
                                                Okay
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent chat-end">
                                        <div class="chat-message">
                                            <p>
                                                Sending you some dough today, you can allocate the resources to this project.
                                            </p>
                                        </div>
                                        <div class="text-right fw-300 text-muted mt-1 fs-xs">
                                            3:26 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get chat-start">
                                        <div class="chat-message">
                                            <p>
                                                Perfect. Thanks a lot!
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get">
                                        <div class="chat-message">
                                            <p>
                                                I will have them ready by tonight.
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get chat-end">
                                        <div class="chat-message">
                                            <p>
                                                Cheers
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment for timestamp -->
                                    <div class="chat-segment">
                                        <div class="time-stamp text-center mb-2 fw-400">
                                            Jun 20
                                        </div>
                                    </div>
                                    <!--  end .chat-segment for timestamp -->
                                </div><div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.6); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 4px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(250, 250, 250); opacity: 0.2; z-index: 90; right: 4px;"></div></div>
                            </div>
                            <!-- END custom-scroll  -->
                            <!-- BEGIN msgr__chatinput -->
                            <div class="d-flex flex-column">
                                <div class="border-faded border-right-0 border-bottom-0 border-left-0 flex-1 mr-3 ml-3 position-relative shadow-top">
                                    <div class="pt-3 pb-1 pr-0 pl-0 rounded-0" tabindex="-1">
                                        <div id="msgr_input" contenteditable="true" data-placeholder="Type your message here..." class="height-10 form-content-editable"></div>
                                    </div>
                                </div>
                                <div class="height-8 px-3 d-flex flex-row align-items-center flex-wrap flex-shrink-0">
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl width-1 mr-1 waves-effect waves-themed" data-toggle="tooltip" data-original-title="More options" data-placement="top">
                                        <i class="fal fa-ellipsis-v-alt color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1 waves-effect waves-themed" data-toggle="tooltip" data-original-title="Attach files" data-placement="top">
                                        <i class="fal fa-paperclip color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1 waves-effect waves-themed" data-toggle="tooltip" data-original-title="Insert photo" data-placement="top">
                                        <i class="fal fa-camera color-fusion-300"></i>
                                    </a>
                                    <div class="ml-auto">
                                        <a href="javascript:void(0);" class="btn btn-info waves-effect waves-themed">Send</a>
                                    </div>
                                </div>
                            </div>
                            <!-- END msgr__chatinput -->
                        </div>
                        <!-- END msgr -->
                    </div>
                </div>
            </div>
        </div>
        <!-- END Messenger -->
        <!-- BEGIN Page Settings -->
        <div class="modal fade js-modal-settings modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-right modal-md">
                <div class="modal-content">
                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center w-100">
                        <h4 class="m-0 text-center color-white">
                            Layout Settings
                            <small class="mb-0 opacity-80">User Interface Settings</small>
                        </h4>
                        <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                    </div>
                    <div class="modal-body p-0">
                        <div class="settings-panel">
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        App Layout
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="fh">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="header-function-fixed"></a>
                                <span class="onoffswitch-title">Fixed Header</span>
                                <span class="onoffswitch-title-desc">header is in a fixed at all times</span>
                            </div>
                            <div class="list" id="nff">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-fixed"></a>
                                <span class="onoffswitch-title">Fixed Navigation</span>
                                <span class="onoffswitch-title-desc">left panel is fixed</span>
                            </div>
                            <div class="list" id="nfm">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-minify"></a>
                                <span class="onoffswitch-title">Minify Navigation</span>
                                <span class="onoffswitch-title-desc">Skew nav to maximize space</span>
                            </div>
                            <div class="list" id="nfh">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-hidden"></a>
                                <span class="onoffswitch-title">Hide Navigation</span>
                                <span class="onoffswitch-title-desc">roll mouse on edge to reveal</span>
                            </div>
                            <div class="list" id="nft">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-top"></a>
                                <span class="onoffswitch-title">Top Navigation</span>
                                <span class="onoffswitch-title-desc">Relocate left pane to top</span>
                            </div>
                            <div class="list" id="fff">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="footer-function-fixed"></a>
                                <span class="onoffswitch-title">Fixed Footer</span>
                                <span class="onoffswitch-title-desc">page footer is fixed</span>
                            </div>
                            <div class="list" id="mmb">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-main-boxed"></a>
                                <span class="onoffswitch-title">Boxed Layout</span>
                                <span class="onoffswitch-title-desc">Encapsulates to a container</span>
                            </div>
                            <div class="expanded">
                                <ul class="mb-3 mt-1">
                                    <li>
                                        <div class="bg-fusion-50" data-action="toggle" data-class="mod-bg-1"></div>
                                    </li>
                                    <li>
                                        <div class="bg-warning-200" data-action="toggle" data-class="mod-bg-2"></div>
                                    </li>
                                    <li>
                                        <div class="bg-primary-200" data-action="toggle" data-class="mod-bg-3"></div>
                                    </li>
                                    <li>
                                        <div class="bg-success-300" data-action="toggle" data-class="mod-bg-4"></div>
                                    </li>
                                    <li>
                                        <div class="bg-white border" data-action="toggle" data-class="mod-bg-none"></div>
                                    </li>
                                </ul>
                                <div class="list" id="mbgf">
                                    <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-fixed-bg"></a>
                                    <span class="onoffswitch-title">Fixed Background</span>
                                </div>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Mobile Menu
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="nmp">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-push"></a>
                                <span class="onoffswitch-title">Push Content</span>
                                <span class="onoffswitch-title-desc">Content pushed on menu reveal</span>
                            </div>
                            <div class="list" id="nmno">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-no-overlay"></a>
                                <span class="onoffswitch-title">No Overlay</span>
                                <span class="onoffswitch-title-desc">Removes mesh on menu reveal</span>
                            </div>
                            <div class="list" id="sldo">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-slide-out"></a>
                                <span class="onoffswitch-title">Off-Canvas <sup>(beta)</sup></span>
                                <span class="onoffswitch-title-desc">Content overlaps menu</span>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Accessibility
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="mbf">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-bigger-font"></a>
                                <span class="onoffswitch-title">Bigger Content Font</span>
                                <span class="onoffswitch-title-desc">content fonts are bigger for readability</span>
                            </div>
                            <div class="list" id="mhc">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-high-contrast"></a>
                                <span class="onoffswitch-title">High Contrast Text (WCAG 2 AA)</span>
                                <span class="onoffswitch-title-desc">4.5:1 text contrast ratio</span>
                            </div>
                            <div class="list" id="mcb">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-color-blind"></a>
                                <span class="onoffswitch-title">Daltonism <sup>(beta)</sup> </span>
                                <span class="onoffswitch-title-desc">color vision deficiency</span>
                            </div>
                            <div class="list" id="mpc">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-pace-custom"></a>
                                <span class="onoffswitch-title">Preloader Inside</span>
                                <span class="onoffswitch-title-desc">preloader will be inside content</span>
                            </div>
                            <div class="list" id="mpi">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-panel-icon"></a>
                                <span class="onoffswitch-title">SmartPanel Icons (not Panels)</span>
                                <span class="onoffswitch-title-desc">smartpanel buttons will appear as icons</span>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Global Modifications
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="mcbg">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-clean-page-bg"></a>
                                <span class="onoffswitch-title">Clean Page Background</span>
                                <span class="onoffswitch-title-desc">adds more whitespace</span>
                            </div>
                            <div class="list" id="mhni">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-nav-icons"></a>
                                <span class="onoffswitch-title">Hide Navigation Icons</span>
                                <span class="onoffswitch-title-desc">invisible navigation icons</span>
                            </div>
                            <div class="list" id="dan">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-disable-animation"></a>
                                <span class="onoffswitch-title">Disable CSS Animation</span>
                                <span class="onoffswitch-title-desc">Disables CSS based animations</span>
                            </div>
                            <div class="list" id="mhic">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-info-card"></a>
                                <span class="onoffswitch-title">Hide Info Card</span>
                                <span class="onoffswitch-title-desc">Hides info card from left panel</span>
                            </div>
                            <div class="list" id="mlph">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-lean-subheader"></a>
                                <span class="onoffswitch-title">Lean Subheader</span>
                                <span class="onoffswitch-title-desc">distinguished page header</span>
                            </div>
                            <div class="list" id="mnl">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-nav-link"></a>
                                <span class="onoffswitch-title">Hierarchical Navigation</span>
                                <span class="onoffswitch-title-desc">Clear breakdown of nav links</span>
                            </div>
                            <div class="list" id="mdn">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-nav-dark"></a>
                                <span class="onoffswitch-title">Dark Navigation</span>
                                <span class="onoffswitch-title-desc">Navigation background is darkend</span>
                            </div>
                            <hr class="mb-0 mt-4">
                            <div class="mt-4 d-table w-100 pl-5 pr-3">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Global Font Size
                                    </h5>
                                </div>
                            </div>
                            <div class="list mt-1">
                                <div class="btn-group btn-group-sm btn-group-toggle my-2" data-toggle="buttons">
                                    <label class="btn btn-default btn-sm waves-effect waves-themed" data-action="toggle-swap" data-class="root-text-sm" data-target="html">
                                        <input type="radio" name="changeFrontSize"> SM
                                    </label>
                                    <label class="btn btn-default btn-sm waves-effect waves-themed active" data-action="toggle-swap" data-class="root-text" data-target="html">
                                        <input type="radio" name="changeFrontSize" checked=""> MD
                                    </label>
                                    <label class="btn btn-default btn-sm waves-effect waves-themed" data-action="toggle-swap" data-class="root-text-lg" data-target="html">
                                        <input type="radio" name="changeFrontSize"> LG
                                    </label>
                                    <label class="btn btn-default btn-sm waves-effect waves-themed" data-action="toggle-swap" data-class="root-text-xl" data-target="html">
                                        <input type="radio" name="changeFrontSize"> XL
                                    </label>
                                </div>
                                <span class="onoffswitch-title-desc d-block mb-0">Change <strong>root</strong> font size to effect rem
                                    values (resets on page refresh)</span>
                            </div>
                            <hr class="mb-0 mt-4">
                            <div class="mt-4 d-table w-100 pl-5 pr-3">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0 pr-2 d-flex">
                                        Theme colors
                                        <a href="#" class="ml-auto fw-400 fs-xs" data-toggle="popover" data-trigger="focus" data-placement="top" title="" data-html="true" data-content="The settings below uses <code>localStorage</code> to load the external <strong>CSS</strong> file as an overlap to the base css. Due to network latency and <strong>CPU utilization</strong>, you may experience a brief flickering effect on page load which may show the intial applied theme for a split second. Setting the prefered style/theme in the header will prevent this from happening." data-original-title="<span class='text-primary'><i class='fal fa-exclamation-triangle mr-1'></i> Heads up!</span>" data-template="<div class=&quot;popover bg-white border-white&quot; role=&quot;tooltip&quot;><div class=&quot;arrow&quot;></div><h3 class=&quot;popover-header bg-transparent&quot;></h3><div class=&quot;popover-body fs-xs&quot;></div></div>"><i class="fal fa-info-circle mr-1"></i> more info</a>
                                    </h5>
                                </div>
                            </div>
                            <div class="expanded theme-colors pl-5 pr-3">
                                <ul class="m-0">
                                    <li>
                                        <a href="#" id="myapp-0" data-action="theme-update" data-themesave="" data-theme="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Wisteria (base css)"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-1" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-1.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tapestry"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-2" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-2.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Atlantis"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-3" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-3.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Indigo"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-4" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-4.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Dodger Blue"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-5" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-5.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tradewind"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-6" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-6.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Cranberry"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-7" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-7.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Oslo Gray"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-8" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-8.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Chetwode Blue"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-9" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-9.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Apricot"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-10" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-10.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Blue Smoke"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-11" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-11.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Green Smoke"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-12" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-12.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Wild Blue Yonder"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-13" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-13.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Emerald"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-14" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-14.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Supernova"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-15" data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-15.css" data-toggle="tooltip" data-placement="top" title="" data-original-title="Hoki"></a>
                                    </li>
                                </ul>
                            </div>
                            <hr class="mb-0 mt-4">
                            <div class="mt-4 d-table w-100 pl-5 pr-3">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0 pr-2 d-flex">
                                        Theme Modes (beta)
                                        <a href="#" class="ml-auto fw-400 fs-xs" data-toggle="popover" data-trigger="focus" data-placement="top" title="" data-html="true" data-content="This is a brand new technique we are introducing which uses CSS variables to infiltrate color options. While this has been working nicely on modern browsers without much issues, some users <strong>may still face issues on Internet Explorer </strong>. Until these issues are resolved or Internet Explorer improves, this feature will remain in Beta" data-original-title="<span class='text-primary'><i class='fal fa-question-circle mr-1'></i> Why beta?</span>" data-template="<div class=&quot;popover bg-white border-white&quot; role=&quot;tooltip&quot;><div class=&quot;arrow&quot;></div><h3 class=&quot;popover-header bg-transparent&quot;></h3><div class=&quot;popover-body fs-xs&quot;></div></div>"><i class="fal fa-question-circle mr-1"></i> why beta?</a>
                                    </h5>
                                </div>
                            </div>
                            <div class="pl-5 pr-3 py-3">
                                <div class="ie-only alert alert-warning d-none">
                                    <h6>Internet Explorer Issue</h6>
                                    This particular component may not work as expected in Internet Explorer. Please use with caution.
                                </div>
                                <div class="row no-gutters">
                                    <div class="col-4 pr-2 text-center">
                                        <div id="skin-default" data-action="toggle-replace" data-replaceclass="mod-skin-light mod-skin-dark" data-class="" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-primary rounded overflow-hidden text-success js-waves-on waves-effect waves-themed" data-original-title="Default Mode" style="height: 80px">
                                            <div class="bg-primary-600 bg-primary-gradient px-2 pt-0 border-right border-primary"></div>
                                            <div class="d-flex flex-column flex-1">
                                                <div class="bg-white border-bottom border-primary py-1"></div>
                                                <div class="bg-faded flex-1 pt-3 pb-3 px-2">
                                                    <div class="py-3" style="background:url('img/demo/s-1.png') top left no-repeat;background-size: 100%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        Default
                                    </div>
                                    <div class="col-4 px-1 text-center">
                                        <div id="skin-light" data-action="toggle-replace" data-replaceclass="mod-skin-dark" data-class="mod-skin-light" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-secondary rounded overflow-hidden text-success js-waves-on waves-effect waves-themed" data-original-title="Light Mode" style="height: 80px">
                                            <div class="bg-white px-2 pt-0 border-right border-"></div>
                                            <div class="d-flex flex-column flex-1">
                                                <div class="bg-white border-bottom border- py-1"></div>
                                                <div class="bg-white flex-1 pt-3 pb-3 px-2">
                                                    <div class="py-3" style="background:url('img/demo/s-1.png') top left no-repeat;background-size: 100%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        Light
                                    </div>
                                    <div class="col-4 pl-2 text-center">
                                        <div id="skin-dark" data-action="toggle-replace" data-replaceclass="mod-skin-light" data-class="mod-skin-dark" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-dark rounded overflow-hidden text-success js-waves-on waves-effect waves-themed" data-original-title="Dark Mode" style="height: 80px">
                                            <div class="bg-fusion-500 px-2 pt-0 border-right"></div>
                                            <div class="d-flex flex-column flex-1">
                                                <div class="bg-fusion-600 border-bottom py-1"></div>
                                                <div class="bg-fusion-300 flex-1 pt-3 pb-3 px-2">
                                                    <div class="py-3 opacity-30" style="background:url('img/demo/s-1.png') top left no-repeat;background-size: 100%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        Dark
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-0 mt-4">
                            <div class="pl-5 pr-3 py-3 bg-faded">
                                <div class="row no-gutters">
                                    <div class="col-6 pr-1">
                                        <a href="#" class="btn btn-outline-danger fw-500 btn-block waves-effect waves-themed" data-action="app-reset">Reset Settings</a>
                                    </div>
                                    <div class="col-6 pl-1">
                                        <a href="#" class="btn btn-danger fw-500 btn-block waves-effect waves-themed" data-action="factory-reset">Factory Reset</a>
                                    </div>
                                </div>
                            </div>
                        </div> <span id="saving"></span>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Page Settings -->
        <script>
            (function(i, s, o, g, r, a, m)
            {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function()
                {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-141754477-1', 'auto');
            ga('send', 'pageview');

        </script>
        <!-- base vendor bundle: 
			 DOC: if you remove pace.js from core please note on Internet Explorer some CSS animations may execute before a page is fully loaded, resulting 'jump' animations 
						+ pace.js (recommended)
						+ jquery.js (core)
						+ jquery-ui-cust.js (core)
						+ popper.js (core)
						+ bootstrap.js (core)
						+ slimscroll.js (extension)
						+ app.navigation.js (core)
						+ ba-throttle-debounce.js (core)
						+ waves.js (extension)
						+ smartpanels.js (extension)
						+ src/../jquery-snippets.js (core) -->
        <script src="js/vendors.bundle.js"></script>
        <script src="js/app.bundle.js"></script>
        <!-- datatble responsive bundle contains: 
	+ jquery.dataTables.js
	+ dataTables.bootstrap4.js
	+ dataTables.autofill.js							
	+ dataTables.buttons.js
	+ buttons.bootstrap4.js
	+ buttons.html5.js
	+ buttons.print.js
	+ buttons.colVis.js
	+ dataTables.colreorder.js							
	+ dataTables.fixedcolumns.js							
	+ dataTables.fixedheader.js						
	+ dataTables.keytable.js						
	+ dataTables.responsive.js							
	+ dataTables.rowgroup.js							
	+ dataTables.rowreorder.js							
	+ dataTables.scroller.js							
	+ dataTables.select.js							
	+ datatables.styles.app.js
	+ datatables.styles.buttons.app.js -->
        <script src="js/datagrid/datatables/datatables.bundle.js"></script>
        <script>
            $(document).ready(function()
            {
                $('#dt-basic-example').dataTable(
                {
                    responsive: true,
                    processing: true,
                    pageLength: false,
                    ajax: 'media/data/2500.json',
                    deferRender: true,
                    scrollY: 300,
                    scrollCollapse: true,
                    scroller: true,
                    columnDefs: [
                    {
                        targets: -1,
                        title: 'Actions',
                        responsivePriority: -1,
                        orderable: false,
                        render: function(data, type, full, meta)
                        {

                            /*
                            -- ES6
                            -- convert using https://babeljs.io online transpiler
                            return `
                            <a href='javascript:void(0);' class='btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1' title='Delete Record'>
                                <i class="fal fa-times"></i>
                            </a>
                            <div class='dropdown d-inline-block'>
                                <a href='#'' class='btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0' data-toggle='dropdown' aria-expanded='true' title='More options'>
                                    <i class="fal fa-ellipsis-v"></i>
                                </a>
                                <div class='dropdown-menu'>
                                    <a class='dropdown-item' href='javascript:void(0);'>Change Status</a>
                                    <a class='dropdown-item' href='javascript:void(0);'>Generate Report</a>
                                </div>
                            </div>`;
                                
                            ES5 example below:  

                            */
                            return "\n\t\t\t\t\t\t<a href='javascript:void(0);' class='btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1' title='Delete Record'>\n\t\t\t\t\t\t\t<i class=\"fal fa-times\"></i>\n\t\t\t\t\t\t</a>\n\t\t\t\t\t\t<div class='dropdown d-inline-block'>\n\t\t\t\t\t\t\t<a href='#'' class='btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0' data-toggle='dropdown' aria-expanded='true' title='More options'>\n\t\t\t\t\t\t\t\t<i class=\"fal fa-ellipsis-v\"></i>\n\t\t\t\t\t\t\t</a>\n\t\t\t\t\t\t\t<div class='dropdown-menu'>\n\t\t\t\t\t\t\t\t<a class='dropdown-item' href='javascript:void(0);'>Change Status</a>\n\t\t\t\t\t\t\t\t<a class='dropdown-item' href='javascript:void(0);'>Generate Report</a>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>";
                        },
                    },
                    {
                        width: "75px",
                        targets: 7,
                        /*  The `data` parameter refers to the data for the cell (defined by the
                            `data` option, which defaults to the column being worked with, in this case `data: 16`.*/
                        render: function(data, type, full, meta)
                        {
                            var badge = {
                                1:
                                {
                                    'title': 'Pending',
                                    'class': 'badge-warning'
                                },
                                2:
                                {
                                    'title': 'Pending',
                                    'class': 'badge-warning'
                                },
                                3:
                                {
                                    'title': 'Canceled',
                                    'class': 'badge-secondary'
                                },
                                4:
                                {
                                    'title': 'Attempt',
                                    'class': 'bg-danger-100 text-white'
                                },
                                5:
                                {
                                    'title': 'Failed',
                                    'class': 'badge-danger text-white'
                                },
                                6:
                                {
                                    'title': 'Delivered',
                                    'class': 'badge-success'
                                },
                                7:
                                {
                                    'title': 'Attention!',
                                    'class': 'badge-primary'
                                },
                                8:
                                {
                                    'title': 'In Progress',
                                    'class': 'bg-success-300'
                                },
                            };
                            if (typeof badge[data] === 'undefined')
                            {
                                return data;
                            }
                            return '<span class="badge ' + badge[data].class + ' badge-pill">' + badge[data].title + '</span>';
                        },
                    }],
                });
            });

        </script>
    
    <!-- END Body -->

</body>
    <!-- END Body -->
</html>
