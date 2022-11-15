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
            General Docs - Documentation - SmartAdmin v4.5.1
        </title>
        <meta name="description" content="General Docs">
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
        <link rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/theme-demo.css">
        <link rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/fa-duotone.css">
        <link rel="stylesheet" media="screen, print" href="<%=request.getContextPath()%>/resources/template/css/fa-brands.css">
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
    <body class="mod-bg-1 mod-nav-link ">
        <!-- DOC: script to save and load page settings -->
        <script>
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
                    <nav id="js-primary-nav" class="primary-nav" role="navigation">
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
                        <ul id="js-nav-menu" class="nav-menu">
                            <li>
                                <a href="#" title="Application Intel" data-filter-tags="application intel">
                                    <i class="fal fa-info-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.application_intel">Application Intel</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="intel_analytics_dashboard.html" title="Analytics Dashboard" data-filter-tags="application intel analytics dashboard">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_analytics_dashboard">Analytics Dashboard</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_marketing_dashboard.html" title="Marketing Dashboard" data-filter-tags="application intel marketing dashboard">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_marketing_dashboard">Marketing Dashboard</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_introduction.html" title="Introduction" data-filter-tags="application intel introduction">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_introduction">Introduction</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_privacy.html" title="Privacy" data-filter-tags="application intel privacy">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_privacy">Privacy</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Theme Settings" data-filter-tags="theme settings">
                                    <i class="fal fa-cog"></i>
                                    <span class="nav-link-text" data-i18n="nav.theme_settings">Theme Settings</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="settings_how_it_works.html" title="How it works" data-filter-tags="theme settings how it works">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_how_it_works">How it works</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_layout_options.html" title="Layout Options" data-filter-tags="theme settings layout options">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_layout_options">Layout Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_theme_modes.html" title="Theme Modes (beta)" data-filter-tags="theme settings theme modes (beta)">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_theme_modes_(beta)">Theme Modes (beta)</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_skin_options.html" title="Skin Options" data-filter-tags="theme settings skin options">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_skin_options">Skin Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_saving_db.html" title="Saving to Database" data-filter-tags="theme settings saving to database">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_saving_to_database">Saving to Database</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="active open">
                                <a href="#" title="Documentation" data-filter-tags="documentation">
                                    <i class="fal fa-book"></i>
                                    <span class="nav-link-text" data-i18n="nav.documentation">Documentation</span>
                                </a>
                                <ul>
                                    <li class="active">
                                        <a href="docs_general.html" title="General Docs" data-filter-tags="documentation general docs">
                                            <span class="nav-link-text" data-i18n="nav.documentation_general_docs">General Docs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_project_structure.html" title="Project Structure" data-filter-tags="documentation project structure">
                                            <span class="nav-link-text" data-i18n="nav.documentation_project_structure">Project Structure</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_flavors_editions.html" title="Flavors & Editions" data-filter-tags="documentation flavors & editions">
                                            <span class="nav-link-text" data-i18n="nav.documentation_flavors_&_editions">Flavors & Editions</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_community_support.html" title="Community Support" data-filter-tags="documentation community support">
                                            <span class="nav-link-text" data-i18n="nav.documentation_community_support">Community Support</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_premium_support.html" title="Premium Support" data-filter-tags="documentation premium support">
                                            <span class="nav-link-text" data-i18n="nav.documentation_premium_support">Premium Support</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_licensing.html" title="Licensing" data-filter-tags="documentation licensing">
                                            <span class="nav-link-text" data-i18n="nav.documentation_licensing">Licensing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs_buildnotes.html" title="Build Notes" data-filter-tags="documentation build notes">
                                            <span class="nav-link-text" data-i18n="nav.documentation_build_notes">Build Notes</span>
                                            <span class="">v4.5.1</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Tools & Components</li>
                            <li>
                                <a href="#" title="UI Components" data-filter-tags="ui components">
                                    <i class="fal fa-window"></i>
                                    <span class="nav-link-text" data-i18n="nav.ui_components">UI Components</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="ui_alerts.html" title="Alerts" data-filter-tags="ui components alerts">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_alerts">Alerts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_accordion.html" title="Accordions" data-filter-tags="ui components accordions">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_accordions">Accordions</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_badges.html" title="Badges" data-filter-tags="ui components badges">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_badges">Badges</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_breadcrumbs.html" title="Breadcrumbs" data-filter-tags="ui components breadcrumbs">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_breadcrumbs">Breadcrumbs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_buttons.html" title="Buttons" data-filter-tags="ui components buttons">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_buttons">Buttons</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_button_group.html" title="Button Group" data-filter-tags="ui components button group">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_button_group">Button Group</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_cards.html" title="Cards" data-filter-tags="ui components cards">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_cards">Cards</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_carousel.html" title="Carousel" data-filter-tags="ui components carousel">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_carousel">Carousel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_collapse.html" title="Collapse" data-filter-tags="ui components collapse">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_collapse">Collapse</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_dropdowns.html" title="Dropdowns" data-filter-tags="ui components dropdowns">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_dropdowns">Dropdowns</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_list_filter.html" title="List Filter" data-filter-tags="ui components list filter">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_list_filter">List Filter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_modal.html" title="Modal" data-filter-tags="ui components modal">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_modal">Modal</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_navbars.html" title="Navbars" data-filter-tags="ui components navbars">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_navbars">Navbars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_panels.html" title="Panels" data-filter-tags="ui components panels">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_panels">Panels</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_pagination.html" title="Pagination" data-filter-tags="ui components pagination">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_pagination">Pagination</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_popovers.html" title="Popovers" data-filter-tags="ui components popovers">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_popovers">Popovers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_progress_bars.html" title="Progress Bars" data-filter-tags="ui components progress bars">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_progress_bars">Progress Bars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_scrollspy.html" title="ScrollSpy" data-filter-tags="ui components scrollspy">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_scrollspy">ScrollSpy</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_side_panel.html" title="Side Panel" data-filter-tags="ui components side panel">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_side_panel">Side Panel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_spinners.html" title="Spinners" data-filter-tags="ui components spinners">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_spinners">Spinners</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tabs_pills.html" title="Tabs & Pills" data-filter-tags="ui components tabs & pills">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tabs_&_pills">Tabs & Pills</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_toasts.html" title="Toasts" data-filter-tags="ui components toasts">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_toasts">Toasts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tooltips.html" title="Tooltips" data-filter-tags="ui components tooltips">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tooltips">Tooltips</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Utilities" data-filter-tags="utilities">
                                    <i class="fal fa-bolt"></i>
                                    <span class="nav-link-text" data-i18n="nav.utilities">Utilities</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="utilities_borders.html" title="Borders" data-filter-tags="utilities borders">
                                            <span class="nav-link-text" data-i18n="nav.utilities_borders">Borders</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_clearfix.html" title="Clearfix" data-filter-tags="utilities clearfix">
                                            <span class="nav-link-text" data-i18n="nav.utilities_clearfix">Clearfix</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_color_pallet.html" title="Color Pallet" data-filter-tags="utilities color pallet">
                                            <span class="nav-link-text" data-i18n="nav.utilities_color_pallet">Color Pallet</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_display_property.html" title="Display Property" data-filter-tags="utilities display property">
                                            <span class="nav-link-text" data-i18n="nav.utilities_display_property">Display Property</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_fonts.html" title="Fonts" data-filter-tags="utilities fonts">
                                            <span class="nav-link-text" data-i18n="nav.utilities_fonts">Fonts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_flexbox.html" title="Flexbox" data-filter-tags="utilities flexbox">
                                            <span class="nav-link-text" data-i18n="nav.utilities_flexbox">Flexbox</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_helpers.html" title="Helpers" data-filter-tags="utilities helpers">
                                            <span class="nav-link-text" data-i18n="nav.utilities_helpers">Helpers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_position.html" title="Position" data-filter-tags="utilities position">
                                            <span class="nav-link-text" data-i18n="nav.utilities_position">Position</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_responsive_grid.html" title="Responsive Grid" data-filter-tags="utilities responsive grid">
                                            <span class="nav-link-text" data-i18n="nav.utilities_responsive_grid">Responsive Grid</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_sizing.html" title="Sizing" data-filter-tags="utilities sizing">
                                            <span class="nav-link-text" data-i18n="nav.utilities_sizing">Sizing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_spacing.html" title="Spacing" data-filter-tags="utilities spacing">
                                            <span class="nav-link-text" data-i18n="nav.utilities_spacing">Spacing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_typography.html" title="Typography" data-filter-tags="utilities typography fonts headings bold lead colors sizes link text states list styles truncate alignment">
                                            <span class="nav-link-text" data-i18n="nav.utilities_typography">Typography</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Menu child" data-filter-tags="utilities menu child">
                                            <span class="nav-link-text" data-i18n="nav.utilities_menu_child">Menu child</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="javascript:void(0);" title="Sublevel Item" data-filter-tags="utilities menu child sublevel item">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_sublevel_item">Sublevel Item</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);" title="Another Item" data-filter-tags="utilities menu child another item">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_another_item">Another Item</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:void(0);" title="Disabled item" data-filter-tags="utilities disabled item">
                                            <span class="nav-link-text" data-i18n="nav.utilities_disabled_item">Disabled item</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Font Icons" data-filter-tags="font icons">
                                    <i class="fal fa-map-marker-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.font_icons">Font Icons</span>
                                    <span class="dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top">7,500+</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="javascript:void(0);" title="FontAwesome" data-filter-tags="font icons fontawesome">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome">FontAwesome Pro</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_fontawesome_light.html" title="Light" data-filter-tags="font icons fontawesome light">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_light">Light</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_regular.html" title="Regular" data-filter-tags="font icons fontawesome regular">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_regular">Regular</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_solid.html" title="Solid" data-filter-tags="font icons fontawesome solid">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_solid">Solid</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_duotone.html" title="Duotone" data-filter-tags="font icons fontawesome duotone">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_duotone">Duotone</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_brand.html" title="Brand" data-filter-tags="font icons fontawesome brand">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_brand">Brand</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="NextGen Icons" data-filter-tags="font icons nextgen icons">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons">NextGen Icons</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_nextgen_general.html" title="General" data-filter-tags="font icons nextgen icons general">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_nextgen_base.html" title="Base" data-filter-tags="font icons nextgen icons base">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_base">Base</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Stack Icons" data-filter-tags="font icons stack icons">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons">Stack Icons</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_stack_showcase.html" title="Showcase" data-filter-tags="font icons stack icons showcase">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_showcase">Showcase</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_stack_generate.html?layers=3" title="Generate Stack" data-filter-tags="font icons stack icons generate stack">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_generate_stack">Generate Stack</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Tables" data-filter-tags="tables">
                                    <i class="fal fa-th-list"></i>
                                    <span class="nav-link-text" data-i18n="nav.tables">Tables</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="tables_basic.html" title="Basic Tables" data-filter-tags="tables basic tables">
                                            <span class="nav-link-text" data-i18n="nav.tables_basic_tables">Basic Tables</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="tables_generate_style.html" title="Generate Table Style" data-filter-tags="tables generate table style">
                                            <span class="nav-link-text" data-i18n="nav.tables_generate_table_style">Generate Table Style</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Form Stuff" data-filter-tags="form stuff">
                                    <i class="fal fa-edit"></i>
                                    <span class="nav-link-text" data-i18n="nav.form_stuff">Form Stuff</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="form_basic_inputs.html" title="Basic Inputs" data-filter-tags="form stuff basic inputs">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_basic_inputs">Basic Inputs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_checkbox_radio.html" title="Checkbox & Radio" data-filter-tags="form stuff checkbox & radio">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_checkbox_&_radio">Checkbox & Radio</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_input_groups.html" title="Input Groups" data-filter-tags="form stuff input groups">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_input_groups">Input Groups</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_validation.html" title="Validation" data-filter-tags="form stuff validation">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_validation">Validation</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Plugins & Addons</li>
                            <li>
                                <a href="#" title="Plugins" data-filter-tags="plugins">
                                    <i class="fal fa-shield-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.plugins">Core Plugins</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="plugins_faq.html" title="Plugins FAQ" data-filter-tags="plugins plugins faq">
                                            <span class="nav-link-text" data-i18n="nav.plugins_plugins_faq">Plugins FAQ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_waves.html" title="Waves" data-filter-tags="plugins waves">
                                            <span class="nav-link-text" data-i18n="nav.plugins_waves">Waves</span>
                                            <span class="dl-ref label bg-primary-400 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_pacejs.html" title="PaceJS" data-filter-tags="plugins pacejs">
                                            <span class="nav-link-text" data-i18n="nav.plugins_pacejs">PaceJS</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">13 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_smartpanels.html" title="SmartPanels" data-filter-tags="plugins smartpanels">
                                            <span class="nav-link-text" data-i18n="nav.plugins_smartpanels">SmartPanels</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_bootbox.html" title="BootBox" data-filter-tags="plugins bootbox alert sound">
                                            <span class="nav-link-text" data-i18n="nav.plugins_bootbox">BootBox</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">15 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_slimscroll.html" title="Slimscroll" data-filter-tags="plugins slimscroll">
                                            <span class="nav-link-text" data-i18n="nav.plugins_slimscroll">Slimscroll</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">5 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_throttle.html" title="Throttle" data-filter-tags="plugins throttle">
                                            <span class="nav-link-text" data-i18n="nav.plugins_throttle">Throttle</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">1 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_navigation.html" title="Navigation" data-filter-tags="plugins navigation">
                                            <span class="nav-link-text" data-i18n="nav.plugins_navigation">Navigation</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">2 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_i18next.html" title="i18next" data-filter-tags="plugins i18next">
                                            <span class="nav-link-text" data-i18n="nav.plugins_i18next">i18next</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">10 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugins_appcore.html" title="App.Core" data-filter-tags="plugins app.core">
                                            <span class="nav-link-text" data-i18n="nav.plugins_app.core">App.Core</span>
                                            <span class="dl-ref label bg-success-700 ml-2">14 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Datatables" data-filter-tags="datatables datagrid">
                                    <i class="fal fa-table"></i>
                                    <span class="nav-link-text" data-i18n="nav.datatables">Datatables</span>
                                    <span class="dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top">235 KB</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="datatables_basic.html" title="Basic" data-filter-tags="datatables datagrid basic">
                                            <span class="nav-link-text" data-i18n="nav.datatables_basic">Basic</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_autofill.html" title="Autofill" data-filter-tags="datatables datagrid autofill">
                                            <span class="nav-link-text" data-i18n="nav.datatables_autofill">Autofill</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_buttons.html" title="Buttons" data-filter-tags="datatables datagrid buttons">
                                            <span class="nav-link-text" data-i18n="nav.datatables_buttons">Buttons</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_export.html" title="Export" data-filter-tags="datatables datagrid export tables pdf excel print csv">
                                            <span class="nav-link-text" data-i18n="nav.datatables_export">Export</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_colreorder.html" title="ColReorder" data-filter-tags="datatables datagrid colreorder">
                                            <span class="nav-link-text" data-i18n="nav.datatables_colreorder">ColReorder</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_columnfilter.html" title="ColumnFilter" data-filter-tags="datatables datagrid columnfilter">
                                            <span class="nav-link-text" data-i18n="nav.datatables_columnfilter">ColumnFilter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_fixedcolumns.html" title="FixedColumns" data-filter-tags="datatables datagrid fixedcolumns">
                                            <span class="nav-link-text" data-i18n="nav.datatables_fixedcolumns">FixedColumns</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_fixedheader.html" title="FixedHeader" data-filter-tags="datatables datagrid fixedheader">
                                            <span class="nav-link-text" data-i18n="nav.datatables_fixedheader">FixedHeader</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_keytable.html" title="KeyTable" data-filter-tags="datatables datagrid keytable">
                                            <span class="nav-link-text" data-i18n="nav.datatables_keytable">KeyTable</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_responsive.html" title="Responsive" data-filter-tags="datatables datagrid responsive">
                                            <span class="nav-link-text" data-i18n="nav.datatables_responsive">Responsive</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_responsive_alt.html" title="Responsive Alt" data-filter-tags="datatables datagrid responsive alt">
                                            <span class="nav-link-text" data-i18n="nav.datatables_responsive_alt">Responsive Alt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_rowgroup.html" title="RowGroup" data-filter-tags="datatables datagrid rowgroup">
                                            <span class="nav-link-text" data-i18n="nav.datatables_rowgroup">RowGroup</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_rowreorder.html" title="RowReorder" data-filter-tags="datatables datagrid rowreorder">
                                            <span class="nav-link-text" data-i18n="nav.datatables_rowreorder">RowReorder</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_scroller.html" title="Scroller" data-filter-tags="datatables datagrid scroller">
                                            <span class="nav-link-text" data-i18n="nav.datatables_scroller">Scroller</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_select.html" title="Select" data-filter-tags="datatables datagrid select">
                                            <span class="nav-link-text" data-i18n="nav.datatables_select">Select</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="datatables_alteditor.html" title="AltEditor" data-filter-tags="datatables datagrid alteditor">
                                            <span class="nav-link-text" data-i18n="nav.datatables_alteditor">AltEditor</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Statistics" data-filter-tags="statistics chart graphs">
                                    <i class="fal fa-chart-pie"></i>
                                    <span class="nav-link-text" data-i18n="nav.statistics">Statistics</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="statistics_flot.html" title="Flot" data-filter-tags="statistics chart graphs flot bar pie">
                                            <span class="nav-link-text" data-i18n="nav.statistics_flot">Flot</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">36 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_chartjs.html" title="Chart.js" data-filter-tags="statistics chart graphs chart.js bar pie">
                                            <span class="nav-link-text" data-i18n="nav.statistics_chart.js">Chart.js</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">205 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_chartist.html" title="Chartist.js" data-filter-tags="statistics chart graphs chartist.js">
                                            <span class="nav-link-text" data-i18n="nav.statistics_chartist.js">Chartist.js</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">39 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_c3.html" title="C3 Charts" data-filter-tags="statistics chart graphs c3 charts">
                                            <span class="nav-link-text" data-i18n="nav.statistics_c3_charts">C3 Charts</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">197 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_peity.html" title="Peity" data-filter-tags="statistics chart graphs peity small">
                                            <span class="nav-link-text" data-i18n="nav.statistics_peity">Peity</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">4 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_sparkline.html" title="Sparkline" data-filter-tags="statistics chart graphs sparkline small tiny">
                                            <span class="nav-link-text" data-i18n="nav.statistics_sparkline">Sparkline</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">42 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_easypiechart.html" title="Easy Pie Chart" data-filter-tags="statistics chart graphs easy pie chart">
                                            <span class="nav-link-text" data-i18n="nav.statistics_easy_pie_chart">Easy Pie Chart</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">4 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="statistics_dygraph.html" title="Dygraph" data-filter-tags="statistics chart graphs dygraph complex">
                                            <span class="nav-link-text" data-i18n="nav.statistics_dygraph">Dygraph</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">120 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Notifications" data-filter-tags="notifications">
                                    <i class="fal fa-exclamation-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.notifications">Notifications</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="notifications_sweetalert2.html" title="SweetAlert2" data-filter-tags="notifications sweetalert2">
                                            <span class="nav-link-text" data-i18n="nav.notifications_sweetalert2">SweetAlert2</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">40 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="notifications_toastr.html" title="Toastr" data-filter-tags="notifications toastr">
                                            <span class="nav-link-text" data-i18n="nav.notifications_toastr">Toastr</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">5 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Form Plugins" data-filter-tags="form plugins">
                                    <i class="fal fa-credit-card-front"></i>
                                    <span class="nav-link-text" data-i18n="nav.form_plugins">Form Plugins</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="form_plugins_colorpicker.html" title="Color Picker" data-filter-tags="form plugins color picker">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_color_picker">Color Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_datepicker.html" title="Date Picker" data-filter-tags="form plugins date picker">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_date_picker">Date Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_daterange_picker.html" title="Date Range Picker" data-filter-tags="form plugins date range picker">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_date_range_picker">Date Range Picker</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_dropzone.html" title="Dropzone" data-filter-tags="form plugins dropzone">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_dropzone">Dropzone</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_ionrangeslider.html" title="Ion.RangeSlider" data-filter-tags="form plugins ion.rangeslider">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_ion.rangeslider">Ion.RangeSlider</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_inputmask.html" title="Inputmask" data-filter-tags="form plugins inputmask">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_inputmask">Inputmask</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_imagecropper.html" title="Image Cropper" data-filter-tags="form plugins image cropper">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_image_cropper">Image Cropper</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_select2.html" title="Select2" data-filter-tags="form plugins select2">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_select2">Select2</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_plugins_summernote.html" title="Summernote" data-filter-tags="form plugins summernote texteditor editor">
                                            <span class="nav-link-text" data-i18n="nav.form_plugins_summernote">Summernote</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Miscellaneous" data-filter-tags="miscellaneous">
                                    <i class="fal fa-globe"></i>
                                    <span class="nav-link-text" data-i18n="nav.miscellaneous">Miscellaneous</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="miscellaneous_fullcalendar.html" title="FullCalendar" data-filter-tags="miscellaneous fullcalendar">
                                            <span class="nav-link-text" data-i18n="nav.miscellaneous_fullcalendar">FullCalendar</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="miscellaneous_lightgallery.html" title="Light Gallery" data-filter-tags="miscellaneous light gallery">
                                            <span class="nav-link-text" data-i18n="nav.miscellaneous_light_gallery">Light Gallery</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">61 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Layouts & Apps</li>
                            <li>
                                <a href="#" title="Pages" data-filter-tags="pages">
                                    <i class="fal fa-plus-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.pages">Page Views</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="page_chat.html" title="Chat" data-filter-tags="pages chat">
                                            <span class="nav-link-text" data-i18n="nav.pages_chat">Chat</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_contacts.html" title="Contacts" data-filter-tags="pages contacts">
                                            <span class="nav-link-text" data-i18n="nav.pages_contacts">Contacts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Forum" data-filter-tags="pages forum">
                                            <span class="nav-link-text" data-i18n="nav.pages_forum">Forum</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_forum_list.html" title="List" data-filter-tags="pages forum list">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_list">List</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_threads.html" title="Threads" data-filter-tags="pages forum threads">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_threads">Threads</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_discussion.html" title="Discussion" data-filter-tags="pages forum discussion">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_discussion">Discussion</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Inbox" data-filter-tags="pages inbox">
                                            <span class="nav-link-text" data-i18n="nav.pages_inbox">Inbox</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_inbox_general.html" title="General" data-filter-tags="pages inbox general">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_read.html" title="Read" data-filter-tags="pages inbox read">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_read">Read</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_write.html" title="Write" data-filter-tags="pages inbox write">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_write">Write</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_invoice.html" title="Invoice (printable)" data-filter-tags="pages invoice (printable)">
                                            <span class="nav-link-text" data-i18n="nav.pages_invoice_(printable)">Invoice (printable)</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Authentication" data-filter-tags="pages authentication">
                                            <span class="nav-link-text" data-i18n="nav.pages_authentication">Authentication</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_forget.html" title="Forget Password" data-filter-tags="pages authentication forget password">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_forget_password">Forget Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_locked.html" title="Locked Screen" data-filter-tags="pages authentication locked screen">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_locked_screen">Locked Screen</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login.html" title="Login" data-filter-tags="pages authentication login">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login">Login</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login_alt.html" title="Login Alt" data-filter-tags="pages authentication login alt">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login_alt">Login Alt</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_register.html" title="Register" data-filter-tags="pages authentication register">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_register">Register</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_confirmation.html" title="Confirmation" data-filter-tags="pages authentication confirmation">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_confirmation">Confirmation</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Error Pages" data-filter-tags="pages error pages">
                                            <span class="nav-link-text" data-i18n="nav.pages_error_pages">Error Pages</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_error.html" title="General Error" data-filter-tags="pages error pages general error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_general_error">General Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_404.html" title="Server Error" data-filter-tags="pages error pages server error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_server_error">Server Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_announced.html" title="Announced Error" data-filter-tags="pages error pages announced error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_announced_error">Announced Error</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_profile.html" title="Profile" data-filter-tags="pages profile">
                                            <span class="nav-link-text" data-i18n="nav.pages_profile">Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_projects.html" title="Projects" data-filter-tags="pages projects">
                                            <span class="nav-link-text" data-i18n="nav.pages_projects">Projects</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_search.html" title="Search Results" data-filter-tags="pages search results">
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
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Chat logs">
                                    <i class="fal fa-comments"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Support Chat">
                                    <i class="fal fa-life-ring"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Make a call">
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
                            <a href="#" class="header-btn btn press-scale-down" data-action="toggle" data-class="mobile-nav-on">
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
                                            <small class="mb-0 opacity-80">User Applications & Addons</small>
                                        </h4>
                                    </div>
                                    <div class="custom-scroll h-100">
                                        <ul class="app-list">
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
                                                <a href="#" class="btn btn-default mt-4 mb-2 pr-5 pl-5"> Add more apps </a>
                                            </li>
                                        </ul>
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
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-messages" data-i18n="drpdwn.messages">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-feeds" data-i18n="drpdwn.feeds">Feeds</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-events" data-i18n="drpdwn.events">Events</a>
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
                                                <ul class="notification">
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
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab-feeds" role="tabpanel">
                                            <div class="custom-scroll h-100">
                                                <ul class="notification">
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
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab-events" role="tabpanel">
                                            <div class="d-flex flex-column h-100">
                                                <div class="h-auto">
                                                    <table class="table table-bordered table-calendar m-0 w-100 h-100 border-0">
                                                        <tr>
                                                            <th colspan="7" class="pt-3 pb-2 pl-3 pr-3 text-center">
                                                                <div class="js-get-date h5 mb-2">[your date here]</div>
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
                                                    </table>
                                                </div>
                                                <div class="flex-1 custom-scroll">
                                                    <div class="p-2">
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
                                                    </div>
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
                                        <span class="float-right fw-n">&commat;codexlantern</span>
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
                            <li class="breadcrumb-item">Documentation</li>
                            <li class="breadcrumb-item active">General Docs</li>
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
                        </ol>
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-book'></i> Documentation: <span class='fw-300'>General Docs</span>
                                <small>
                                    Product documentation, plugin reference, and online help
                                </small>
                            </h1>
                        </div>
                        <a href="javascript:void(0);" name="top"></a>
                        <ul class="fs-md fw-700 mb-5 list-spaced">
                            <li>
                                <a href="#introduction">Introduction</a>
                            </li>
                            <li>
                                <a href="#gulp">Gulp Installation For Advanced Usage</a>
                            </li>
                            <li>
                                <a href="#buildjson">Build.json For Gulp Usage</a>
                            </li>
                            <li>
                                <a href="#app.config.js">Configuration JS</a>
                            </li>
                            <li>
                                <a href="#applayouts">Layout Options</a>
                            </li>
                            <li>
                                <a href="#skinsthemes">Skins & Themes</a>
                            </li>
                            <li>
                                <a href="#seedslim">Seed & Slim Projects</a>
                            </li>
                            <li>
                                <a href="#filestructure">File Structure</a>
                            </li>
                            <li>
                                <a href="#pluginreference">Plugin Reference & Dependency</a>
                            </li>
                            <li>
                                <a href="#rtlsupport">RTL Support</a>
                            </li>
                            <li>
                                <a href="#productsupport">Product Support</a>
                            </li>
                            <li>
                                <a href="#changingcomponentcolors">Changing Component Colors</a>
                            </li>
                            <li>
                                <a href="#browsersupport">Browser Support</a>
                            </li>
                            <li>
                                <a href="#components">Components</a>
                            </li>
                        </ul>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Introduction <a href="javascript:void(0);" name="introduction"></a>
                                    <small>
                                        First of all, thank you so much for supporting our product! We are excited to have you as our customer and as with any Theme and/or Product, good documentation is essential to provide you with that first solid impression and we hope we have delivered on that expectation.
                                    </small>
                                </h2>
                                <div class="panel-tag">
                                    You can use the Table of Contents below to quickly jump to each section and find a quick reference to all the pages that we currently have available. However, if you do find something missing, do feel free to voice your opinion and/or requests on our Support Forum! We check these on a near daily basis and many customers have already contributed great ideas that have made it into updates of the Theme and the documentation!
                                </div>
                                <p>
                                    <strong>Once again it is great to have you onboard and thank you -very- much for supporting this project!</strong>
                                </p>
                                <p>
                                    This template and projects demonstrates the core principles and concepts of how you can integrate SmartAdmin 4 with your favorite backend platform. We aim, and do our best, to create a reference project based on community adopted guidelines and principles. That said, with our years of experience and our focus on quality we believe that this template will provide you with a great starting point that you can use for your own project purposes and customizations.
                                </p>
                                <p class="mb-g">
                                    What this template, and documentation is not however, is a tutorial and/or introduction in all things HTML. For that we would kindly ask you to check the Resources listed below and go through all the pages for all the components, each component has either a link to its documentation source or examples of usage. Some level of knowledge on these topics will be required when explaining and discussing the theme and project, but we will do our best to ensure that all levels of experience can benefit and read along.
                                </p>
                                <strong>Where to Start?</strong>
                                <p>The best area to start is with this documentation page. If you are looking for a blank slate, a nice bet would be to go with <a href="blank.html" title="blank" target="_blank">Blank Page</a>, it has everything you need to get started with the barebone essentials only.</p>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Gulp Installation For Advanced Usage <a href="javascript:void(0);" name="gulp"></a>
                                    <small class="m-0">
                                        This webapp UI toolkit is based on Bootstrap 4 framework that provides a complete frontend user interface to build any type of web or mobile application. The package includes state of the art build tools to manage and deploy project assets with ease. This documentation will provide information you need to be able to use SmartAdmin WebApp in your applications, customising it to match your development needs and requirements at a fast pace environment.
                                        <br>
                                        <br>
                                        This section guides you to install all required software and libraries in order to fully utilize this UI toolkit for your project(s).
                                        <br>
                                        <a class="h3 mt-5 btn btn-primary" target="_blank" href="https://www.youtube.com/watch?v=LwD-kYlZXtw">Watch the video ►</a>
                                    </small>
                                </h2>
                                <hr class="my-5">
                                <ol class="list-spaced fs-md">
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Install Git (<span class="fw-500 text-danger">important</span>)
                                        </strong>
                                        <p>
                                            Before you start using Git, you have to make it available on your computer. Even if it’s already installed, it’s probably a good idea to update to the latest version. You can either install it as a package or via another installer, or <a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git" target="_blank">download the source code</a> and compile it yourself
                                        </p>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Install Node.js
                                        </strong>
                                        <p>
                                            Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js is required in order to run the application build tools. Download the latest version of Node and install it: <a href="https://nodejs.org/en/download/" target="_blank">nodejs.org/en/download/</a>
                                        </p>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Install NPM
                                        </strong>
                                        <p class="mb-1">
                                            Npm is the package manager for JavaScript and the world’s largest software registry. Npm is a separate project from Node.js, and tends to update more frequently. As a result, even if you’ve just downloaded Node.js (and therefore npm), you’ll probably need to update your npm.
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					npm install npm@latest -g
				</code>
                                        <p class="mb-1">
                                            Verify that npm in successfully installed, and version of installed npm will appear.
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
				 npm --version
				</code>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Install Gulp
                                        </strong>
                                        <p class="mb-1">
                                            Gulp is a toolkit that helps you automate your time-consuming tasks in development workflow. To install gulp globally.
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					npm install gulp-cli -g
				</code>
                                        <p class="mb-1">
                                            If you have previously installed a version of <code>gulp</code> globally, please remove it to make sure old version doesn't collide with new <code>gulp-cli</code>
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					npm rm --global gulp
				</code>
                                        <p class="mb-1">
                                            Verify that gulp in successfully installed, and version of installed gulp will appear.
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					gulp --version
				</code>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Install NPM Packages
                                        </strong>
                                        <p class="mb-1">
                                            NPM packages are a great way to ensure your files are up to date and everyone in your development tree is using the same version for the files. To install the npm you simple type:
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-1 w-100">
					npm install
				</code>
                                        <div class="mb-g help-block">
                                            You may or may not see some messages regarding vulnerabilities, we and the npm community, are aware of these issues and you can choose to ignore them or upgrade your jquery to the latest version (warning: doing so may break IE10 Datatables responsive plugin)
                                        </div>
                                        <p class="mb-1">
                                            Check outdated files and versions by typing:
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					npm outdated
				</code>
                                        <p>
                                            If you are updating the npm packages, please be sure to read their changelogs for any breaking changes before you do any major update. To update a package, simple open your package.json file and change the version number run <code>npm i</code> command
                                        </p>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Build project
                                        </strong>
                                        <p>
                                            Once all your NPM packages are installed you can now run the command to build your project. The build project will compile your project and create the necessary HTML files, CSS, and JS scripts related for each page. Once the compilation is completed, gulp will switch to 'watch' mode and watch for changes in your JS/HBS templates/SCSS files. Any changes you make, gulp will auto compile the project in seconds.
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					gulp build
				</code>
                                        <p>
                                            Once the compilation is complete, you can go to <a href="http://localhost:4000" target="_blank">http://localhost:4000</a> to view your compiled project
                                        </p>
                                    </li>
                                    <li>
                                        <strong class="mb-1 d-block fs-lg">
                                            Other commands
                                        </strong>
                                        <p class="mb-1">
                                            Gulp watch will initialize the file watch process and start the server
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					gulp watch
				</code>
                                        <p class="mb-1">
                                            Gulp build-nav will build the _nav.hbs file from your nav.json file
                                        </p>
                                        <code class="bg-fusion-500 d-block pt-2 pr-3 pb-2 pl-3 fw-700 mb-g w-100">
					gulp build-nav
				</code>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Build.json For Gulp Usage <a href="javascript:void(0);" name="buildjson"></a>
                                    <small>
                                        Configure your project files <code>build.json</code>. You can completely slim down your project through the build.json file.
                                    </small>
                                </h2>
                                <div class="fw-500 mb-1">
                                    File app.config.js contents
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint fs-md mb-0" style="max-height: 250px;">
{
	"config": {
		"debug": false,
		"data" : {
			"app": "SmartAdmin",
			"app-name": "SmartAdmin WebApp",
			"app-flavor": "SmartAdmin WebApp",
			"app-flavor-subscript": "",
			"user": "Dr. Codex Lantern",
			"email": "drlantern@gotbootstrap.com",
			"twitter": "codexlantern",
			"avatar": "avatar-admin.png",
			"version": "4.5.1",
			"bs4v": "4.5",
			"logo": "logo.png",
			"logo-m": "logo.png",
			"copyright": "2020 © SmartAdmin by&amp;nbsp;&lt;a href&#x3D;&#x27;https://www.gotbootstrap.com&#x27; class&#x3D;&#x27;text-primary fw-500&#x27; title&#x3D;&#x27;gotbootstrap.com&#x27; target&#x3D;&#x27;_blank&#x27;&gt;gotbootstrap.com&lt;/a&gt;",
			"copyright-inverse": "2020 © SmartAdmin by&amp;nbsp;&lt;a href&#x3D;&#x27;https://www.gotbootstrap.com&#x27; class&#x3D;&#x27;text-white opacity-40 fw-500&#x27; title&#x3D;&#x27;gotbootstrap.com&#x27; target&#x3D;&#x27;_blank&#x27;&gt;gotbootstrap.com&lt;/a&gt;",
			"iconPrefix": "fal",
			"layoutSettings": true,
			"chatInterface": true,
			"shortcutMenu": true,
			"appLayoutShortcut": true,
			"appShortcutModal": true,
			"appHeader": true,
			"appFooter": true,
			"appSidebar": true
		},
		"compile": {
			"jsUglify": false,
			"cssMinify": false,
			"jsSourcemaps": false,
			"cssSourcemaps": true,
			"autoprefixer": true,
			"seedOnly": false,
			"rtl": false
		},
		"path": {
			"src": "./src",
			"node_modules": "./node_modules",
			"exportPath": "./src/template/include/_nav.hbs",
			"outputPath": "./src/template/include"
		},
		"dist": {
			"theme": {
				"path": "./dist"
			}
		}
	},
	"build": {
		"vendors": {
			"base": {
				"src": {
					"required": {   
						"pace-js": {
							"scripts": [
								"{$config.path.node_modules}/pace-js/pace.js"
							]
						},          
						"jquery": {
							"scripts": [
								"{$config.path.node_modules}/jquery/dist/jquery.js"
							]
						},
						"jquery-ui": {
							"scripts": [
								"{$config.path.src}/custom/plugins/jquery-ui-cust/jquery-ui-cust.js"
							]
						},  
						"bootstrap": {
							"styles": [
								"{$config.path.src}/scss/bootstrap.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/popper.js/dist/umd/popper.js",
								"{$config.path.node_modules}/bootstrap/dist/js/bootstrap.js"
							]
						},
						"bootbox": {
							"scripts": [
								"{$config.path.src}/custom/plugins/bootbox/bootbox-cust.js",
								"{$config.path.src}/custom/plugins/bootbox/bootbox-config.js"
							]
						},
						"jquery-snippets": {
							"scripts": [
								"{$config.path.src}/custom/plugins/jquery-snippets/jquery-snippets.js"
							]
						},
						"throttle-debounce": {
							"scripts": [
								"{$config.path.node_modules}/jquery-throttle-debounce/jquery.ba-throttle-debounce.js"
							]
						},
						"webfonts": {
							"styles": [
								"{$config.path.src}/scss/app.icons.scss"
							],
							"fonts": [
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/webfonts/**",
								"{$config.path.src}/custom/webfonts/nextgen-fonts-master/webfonts/**",
								"{$config.path.src}/custom/webfonts/plugins/summernote/**"
							]
						}                           
					},
					"optional": {
						"jquery-slimscroll": {
							"scripts": [
								"{$config.path.node_modules}/jquery-slimscroll/jquery.slimscroll.js"
							]
						},
						"waves": {
							"scripts": [
								"{$config.path.node_modules}/node-waves/dist/waves.js"
							]
						},
						"smartpanels": {
							"scripts": [
								"{$config.path.src}/custom/plugins/smartpanels/smartpanels.js"
							]
						},
						"app-images" : {
							"images" : [
								"{$config.path.src}/img/**"
							]
						},
						"app-data": {
							"json" : [
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/used-for-demo-pages/*.json",
								"{$config.path.src}/custom/webfonts/nextgen-fonts-master/used-for-demo-pages/*.json",
								"{$config.path.src}/custom/plugins/datatables/demo-data/*.json",
								"{$config.path.src}/custom/docs-data/*.json",
								"{$config.path.src}/custom/lang/*.json"
								
							]
						},
						"app-media": {
							"media" : [
								"{$config.path.src}/custom/media/**"
							]
						}
					}
				},
				"bundle": {
					"styles": "{$config.output}/css/vendors.bundle.css",
					"scripts": "{$config.output}/js/vendors.bundle.js",
					"images": "{$config.output}/img",
					"fonts": "{$config.output}/webfonts",
					"json": "{$config.output}/media/data/",
					"media": "{$config.output}/media"
				}
			},
			"custom": {
				"i18next": {
					"src": {
						"scripts": [
							"{$config.path.node_modules}/i18next-client/i18next.js"
						]
					},
					"bundle": {
						"scripts": "{$config.output}/js/i18n/i18n.js"
					}
				},
				"fontawesome": {
					"light" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/scss/light.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/fa-light.scss"
						}
					},
					"regular" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/scss/regular.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/fa-regular.scss"
						}
					},
					"solid" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/scss/solid.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/fa-solid.scss"
						}
					},
					"duotone" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/scss/duotone.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/fa-duotone.scss"
						}
					},
					"brand" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/webfonts/fontawesome-pro-master/scss/brands.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/fa-brands.scss"
						}
					}
				}
			},
			"addons": {
				"statistics" : {
					"dygraph" : {
						"plugin" : {
							"src": {
								"styles":[
									"{$config.path.node_modules}/dygraphs/dist/dygraph.css"
								],
								"scripts": [
									"{$config.path.node_modules}/dygraphs/dist/dygraph.min.js"
								]
							},
							"bundle": {
								"styles": "{$config.output}/css/statistics/dygraph/dygraph.css",
								"scripts": "{$config.output}/js/statistics/dygraph/dygraph.js"
							}
						},
						"demo-data" : {
							"src": {
								"scripts": [
									"{$config.path.src}/custom/demo-data/demo-data-dygraph.js"
								]
							},
							"bundle": {
								"scripts": "{$config.output}/js/statistics/demo-data/demo-data-dygraph.js"
							}
						}   
					},
					"flotchart" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/flot/jquery.flot.js",
								"{$config.path.node_modules}/flot/jquery.colorhelpers.js",
								"{$config.path.node_modules}/flot/jquery.flot.canvas.js",
								"{$config.path.node_modules}/flot/jquery.flot.categories.js",
								"{$config.path.node_modules}/flot/jquery.flot.crosshair.js",
								"{$config.path.node_modules}/flot/jquery.flot.errorbars.js",
								"{$config.path.node_modules}/flot/jquery.flot.fillbetween.js",
								"{$config.path.node_modules}/flot/jquery.flot.image.js",
								"{$config.path.node_modules}/flot/jquery.flot.navigate.js",
								"{$config.path.node_modules}/flot/jquery.flot.pie.js",
								"{$config.path.node_modules}/flot/jquery.flot.resize.js",
								"{$config.path.node_modules}/flot/jquery.flot.selection.js",
								"{$config.path.node_modules}/flot/jquery.flot.stack.js",
								"{$config.path.node_modules}/flot-spline/js/jquery.flot.spline.js",
								"{$config.path.node_modules}/flot/jquery.flot.symbol.js",
								"{$config.path.node_modules}/flot/jquery.flot.threshold.js",
								"{$config.path.node_modules}/jquery.flot.tooltip/js/jquery.flot.tooltip.js",
								"{$config.path.node_modules}/flot/jquery.flot.time.js"
							]
						},
						"bundle": {"scripts": "{$config.output}/js/statistics/flot/flot.bundle.js"}
					},
					"chartjs" : {
						"src": {
							"styles":[
								"{$config.path.node_modules}/chart.js/dist/Chart.css"
							],
							"scripts": [
								"{$config.path.node_modules}/chart.js/dist/Chart.bundle.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/statistics/chartjs/chartjs.css",
							"scripts": "{$config.output}/js/statistics/chartjs/chartjs.bundle.js"
						}
					},
					"chartist" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/plugins/chartist/chartist.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/chartist/dist/chartist.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/statistics/chartist/chartist.css",
							"scripts": "{$config.output}/js/statistics/chartist/chartist.js"
						}
					},
					"d3" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/d3/dist/d3.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/statistics/d3/d3.js"
						}
					},
					"c3" : {
						"plugin": {
							"src": {
								"styles":[
									"{$config.path.node_modules}/c3/c3.css"
								],
								"scripts": [
									"{$config.path.node_modules}/c3/c3.js"
								]
							},
							"bundle": {
								"styles": "{$config.output}/css/statistics/c3/c3.css",
								"scripts": "{$config.output}/js/statistics/c3/c3.js"
							}
						},
						"demo-data": {
							"src": {
								"scripts": [
									"{$config.path.src}/custom/demo-data/demo-c3.js"
								]
							},
							"bundle": {
								"scripts": "{$config.output}/js/statistics/demo-data/demo-c3.js"
							}
						}
					},
					"peity" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/peity/jquery.peity.js",
								"{$config.path.src}/custom/plugins/peity/jquery.peity.config.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/statistics/peity/peity.bundle.js"
						}
					},
					"sparkline" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/jquery-sparkline/jquery.sparkline.js",
								"{$config.path.src}/custom/plugins/jquery-sparkline/jquery-sparkline.config.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/statistics/sparkline/sparkline.bundle.js"
						}
					},
					"easypiechart" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/easy-pie-chart/dist/jquery.easypiechart.js",
								"{$config.path.src}/custom/plugins/easy-pie-chart/jquery.easypiechart.config.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/statistics/easypiechart/easypiechart.bundle.js"
						}
					}
				},
				"datagrid" : {
					"datatables" : {
						"core" : {
							"src": {
								"styles":[
									"{$config.path.node_modules}/datatables.net-bs4/css/dataTables.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-autofill-bs4/css/autoFill.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-buttons-bs4/css/buttons.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-fixedcolumns-bs4/css/fixedColumns.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-keytable-bs4/css/keyTable.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-responsive-bs4/css/responsive.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-rowgroup-bs4/css/rowGroup.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-scroller-bs4/css/scroller.bootstrap4.css",
									"{$config.path.node_modules}/datatables.net-select-bs4/css/select.bootstrap4.css",
									"{$config.path.src}/custom/plugins/datatables/datatables.styles.app.scss"
								],
								"scripts": [
									"{$config.path.node_modules}/datatables.net/js/jquery.dataTables.js",
									"{$config.path.node_modules}/datatables.net-bs4/js/dataTables.bootstrap4.js",
									"{$config.path.src}/custom/plugins/datatables/datatables.styles.app.js",
									"{$config.path.node_modules}/datatables.net-autofill/js/dataTables.autoFill.js",                            
									"{$config.path.node_modules}/datatables.net-autofill-bs4/js/autoFill.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-buttons/js/dataTables.buttons.js",
									"{$config.path.node_modules}/datatables.net-buttons-bs4/js/buttons.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-buttons/js/buttons.html5.js",
									"{$config.path.node_modules}/datatables.net-buttons/js/buttons.print.js",
									"{$config.path.node_modules}/datatables.net-buttons/js/buttons.colVis.js",
									"{$config.path.src}/custom/plugins/datatables/datatables.styles.buttons.app.js",
									"{$config.path.node_modules}/datatables.net-colreorder/js/dataTables.colReorder.js",                            
									"{$config.path.node_modules}/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-fixedcolumns/js/dataTables.fixedColumns.js",                            
									"{$config.path.node_modules}/datatables.net-fixedcolumns-bs4/js/fixedColumns.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-fixedheader/js/dataTables.fixedHeader.js",                          
									"{$config.path.node_modules}/datatables.net-fixedheader-bs4/js/fixedHeader.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-keytable/js/dataTables.keyTable.js",                            
									"{$config.path.node_modules}/datatables.net-keytable-bs4/js/keyTable.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-responsive/js/dataTables.responsive.js",                            
									"{$config.path.node_modules}/datatables.net-responsive-bs4/js/responsive.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-rowgroup/js/dataTables.rowGroup.js",                            
									"{$config.path.node_modules}/datatables.net-rowgroup-bs4/js/rowGroup.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-rowreorder/js/dataTables.rowReorder.js",                            
									"{$config.path.node_modules}/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-scroller/js/dataTables.scroller.js",                            
									"{$config.path.node_modules}/datatables.net-scroller-bs4/js/scroller.bootstrap4.js",
									"{$config.path.node_modules}/datatables.net-select/js/dataTables.select.js",                            
									"{$config.path.node_modules}/datatables.net-select-bs4/js/select.bootstrap4.js",
									"{$config.path.src}/custom/plugins/datatables-alteditor/datatables-alteditor.js"
								]
							},
							"bundle": {
								"styles": "{$config.output}/css/datagrid/datatables/datatables.bundle.css",
								"scripts": "{$config.output}/js/datagrid/datatables/datatables.bundle.js"
							}   
						},
						"export" : {
							"src": {
								"scripts": [
									"{$config.path.node_modules}/jszip/dist/jszip.js",
									"{$config.path.node_modules}/pdfmake/build/pdfmake.js",
									"{$config.path.node_modules}/pdfmake/build/vfs_fonts.js"                                    
								]
							},
							"bundle": {
								"scripts": "{$config.output}/js/datagrid/datatables/datatables.export.js"
							}
						}
					}
				},
				"notifications" : {
					"toastr" : {
						"src": {
							"styles":[
								"{$config.path.node_modules}/toastr/toastr.scss",
								"{$config.path.src}/custom/plugins/toastr/toastr-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/toastr/toastr.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/notifications/toastr/toastr.css",
							"scripts": "{$config.output}/js/notifications/toastr/toastr.js"
						}
					},
					"sweetalert2" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/plugins/sweetalert2/sweetalert2.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/es6-promise-polyfill/promise.js",
								"{$config.path.node_modules}/sweetalert2/dist/sweetalert2.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/notifications/sweetalert2/sweetalert2.bundle.css",
							"scripts": "{$config.output}/js/notifications/sweetalert2/sweetalert2.bundle.js"
						}
					}
				},
				"formplugins" : {
					"colorpicker" : {
						"src": {
							"styles":[
								"{$config.path.node_modules}/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.css"
							],
							"scripts": [
								"{$config.path.node_modules}/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/bootstrap-colorpicker/bootstrap-colorpicker.css",
							"scripts": "{$config.output}/js/formplugins/bootstrap-colorpicker/bootstrap-colorpicker.js"
						}
					},
					"datepicker" : {
						"src": {
							"styles": [
								"{$config.path.node_modules}/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css",
								"{$config.path.src}/custom/plugins/datepicker/datepicker-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/bootstrap-datepicker/bootstrap-datepicker.css",
							"scripts": "{$config.output}/js/formplugins/bootstrap-datepicker/bootstrap-datepicker.js"
						}
					},
					"daterangepicker" : {
						"src": {
							"styles": [
								"{$config.path.node_modules}/bootstrap-daterangepicker/daterangepicker.css",
								"{$config.path.src}/custom/plugins/daterangepicker/daterangepicker-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/bootstrap-daterangepicker/daterangepicker.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/bootstrap-daterangepicker/bootstrap-daterangepicker.css",
							"scripts": "{$config.output}/js/formplugins/bootstrap-daterangepicker/bootstrap-daterangepicker.js"
						}
					},
					"dropzone" : {
						"src": {
							"styles": [
								"{$config.path.node_modules}/dropzone/dist/dropzone.css",
								"{$config.path.src}/custom/plugins/dropzone/dropzone-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/dropzone/dist/dropzone.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/dropzone/dropzone.css",
							"scripts": "{$config.output}/js/formplugins/dropzone/dropzone.js"
						}                   
					},
					"ion-rangeslider": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/ion-rangeslider/css/ion.rangeSlider.css",
								"{$config.path.src}/custom/plugins/ion-rangeslider/ion.rangeslider-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/ion-rangeslider/js/ion.rangeSlider.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/ion-rangeslider/ion-rangeslider.css",
							"scripts": "{$config.output}/js/formplugins/ion-rangeslider/ion-rangeslider.js"
						}   
					},
					"inputmusk": {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/inputmask/dist/jquery.inputmask.bundle.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/formplugins/inputmask/inputmask.bundle.js"
						}   
					},
					"cropper": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/cropperjs/dist/cropper.css",
								"{$config.path.src}/custom/plugins/cropperjs/cropper-demo.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/cropperjs/dist/cropper.js",
								"{$config.path.node_modules}/jquery-cropper/dist/jquery-cropper.js"
								
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/cropperjs/cropper.css",
							"scripts": "{$config.output}/js/formplugins/cropperjs/cropper.js"
						}   
					},
					"select2": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/select2/dist/css/select2.css",
								"{$config.path.src}/custom/plugins/select2/select2-cust.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/select2/dist/js/select2.full.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/select2/select2.bundle.css",
							"scripts": "{$config.output}/js/formplugins/select2/select2.bundle.js"
						}   
					},
					"summernote": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/summernote/dist/summernote-bs4.css",
								"{$config.path.src}/custom/plugins/summernote/summernote-custom.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/summernote/dist/summernote-bs4.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/summernote/summernote.css",
							"scripts": "{$config.output}/js/formplugins/summernote/summernote.js"
						}   
					},
					"markdown": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/bootstrap-markdown/css/bootstrap-markdown.min.css"
							],
							"scripts": [
								"{$config.path.node_modules}/markdown/lib/markdown.js",
								"{$config.path.node_modules}/bootstrap-markdown/js/bootstrap-markdown.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/bootstrap-markdown/bootstrap-markdown.css",
							"scripts": "{$config.output}/js/formplugins/bootstrap-markdown/bootstrap-markdown.js"
						}   
					},
					"nouislider": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/nouislider/distribute/nouislider.css"
							],
							"scripts": [
								"{$config.path.node_modules}/nouislider/distribute/nouislider.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/nouislider/nouislider.css",
							"scripts": "{$config.output}/js/formplugins/nouislider/nouislider.js"
						}   
					},
					"wizard": {
						"src": {
							"styles": [
								"{$config.path.node_modules}/smartwizard/dist/css/smart_wizard.css",
								"{$config.path.node_modules}/smartwizard/dist/css/smart_wizard_theme_arrows.css",
								"{$config.path.node_modules}/smartwizard/dist/css/smart_wizard_theme_circles.css",
								"{$config.path.node_modules}/smartwizard/dist/css/smart_wizard_theme_dots.css"
							],
							"scripts": [
								"{$config.path.node_modules}/smartwizard/dist/js/jquery.smartWizard.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/formplugins/smartwizard/smartwizard.css",
							"scripts": "{$config.output}/js/formplugins/smartwizard/smartwizard.js"
						}   
					}
				},
				"miscellaneous" : {
					"fullcalendar" : {
						"src": {
							"styles":[
								"{$config.path.node_modules}/@fullcalendar/core/main.css",
								"{$config.path.node_modules}/@fullcalendar/daygrid/main.css",
								"{$config.path.node_modules}/@fullcalendar/list/main.css",
								"{$config.path.node_modules}/@fullcalendar/timegrid/main.css",
								"{$config.path.node_modules}/@fullcalendar/bootstrap/main.css",
								"{$config.path.src}/custom/plugins/@fullcalendar/core-main-override.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/@fullcalendar/core/main.js",
								"{$config.path.node_modules}/@fullcalendar/daygrid/main.js",
								"{$config.path.node_modules}/@fullcalendar/list/main.js",
								"{$config.path.node_modules}/@fullcalendar/timegrid/main.js",
								"{$config.path.node_modules}/@fullcalendar/interaction/main.js",
								"{$config.path.src}/custom/plugins/@fullcalendar/bootstrap-main-cust.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/miscellaneous/fullcalendar/fullcalendar.bundle.css",
							"scripts": "{$config.output}/js/miscellaneous/fullcalendar/fullcalendar.bundle.js"
						}
					},
					"lightgallery" : {
						"src": {
							"styles":[
								"{$config.path.node_modules}/justifiedGallery/dist/css/justifiedGallery.css",
								"{$config.path.src}/custom/plugins/lightgallery/lightgallery.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/justifiedGallery/dist/js/jquery.justifiedGallery.js",
								"{$config.path.node_modules}/jquery-mousewheel/jquery.mousewheel.js",
								"{$config.path.node_modules}/lightgallery/src/js/lightgallery.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-autoplay.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-fullscreen.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-hash.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-pager.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-thumbnail.js",
								"{$config.path.node_modules}/lightgallery/modules/lg-zoom.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/miscellaneous/lightgallery/lightgallery.bundle.css",
							"scripts": "{$config.output}/js/miscellaneous/lightgallery/lightgallery.bundle.js"
						}
					},
					"smartvoice" : {
						"src": {
							"scripts": [
								"{$config.path.src}/custom/plugins/smartvoice/smartvoice-config.js",
								"{$config.path.src}/custom/plugins/smartvoice/smartvoice.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/miscellaneous/lightgallery/smartvoice.bundle.js"
						}
					},
					"reactions" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/plugins/reactions/reactions.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/miscellaneous/reactions/reactions.css"
						}
					},
					"jqvmap" : {
						"core" : {
							"src": {
								"styles":[
									"{$config.path.node_modules}/jqvmap/dist/jqvmap.css",
									"{$config.path.src}/custom/plugins/jqvmap/jqvmap-cust.scss"
								],
								"scripts": [
									"{$config.path.node_modules}/jqvmap/dist/jquery.vmap.js",
									"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.world.js"
								]
							},
							"bundle": {
								"styles": "{$config.output}/css/miscellaneous/jqvmap/jqvmap.bundle.css",
								"scripts": "{$config.output}/js/miscellaneous/jqvmap/jqvmap.bundle.js"
							}
						},
						"maps" : {
							"algeria" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.algeria.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.algeria.js"
								}
							},
							"argentina" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.argentina.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.argentina.js"
								}
							},
							"brazil" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.brazil.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.brazil.js"
								}
							},
							"canada" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.canada.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.canada.js"
								}
							},
							"europe" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.europe.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.europe.js"
								}
							},
							"france" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.france.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.france.js"
								}
							},
							"germany" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.germany.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.germany.js"
								}
							},
							"greece" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.greece.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.greece.js"
								}
							},
							"iran" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.iran.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.iran.js"
								}
							},
							"iraq" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.iraq.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.iraq.js"
								}
							},
							"russia" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.russia.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.russia.js"
								}
							},
							"tunisia" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.tunisia.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.tunisia.js"
								}
							},
							"turkey" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.turkey.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.turkey.js"
								}
							},
							"usa" : {
								"src": {
									"scripts": [
										"{$config.path.node_modules}/jqvmap/dist/maps/jquery.vmap.usa.js"
									]
								},
								"bundle": {
									"scripts": "{$config.output}/js/miscellaneous/jqvmap/maps/jquery.vmap.usa.js"
								}
							}
						}
					},
					"nestable" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/plugins/nestable/nestable.scss"
							],
							"scripts": [
								"{$config.path.node_modules}/nestable/jquery.nestable.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/miscellaneous/nestable/nestable.css",
							"scripts": "{$config.output}/js/miscellaneous/nestable/nestable.js"
						}
					},
					"treeview" : {
						"src": {
							"styles":[
								"{$config.path.src}/custom/plugins/treeview/treeview.scss"
							],
							"scripts": [
								"{$config.path.src}/custom/plugins/treeview/treeview.js"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/miscellaneous/treeview/treeview.css",
							"scripts": "{$config.output}/js/miscellaneous/treeview/treeview.js"
						}
					}
				},
				"dependencyplugins" : {
					"moment" : {
						"src": {
							"scripts": [
								"{$config.path.node_modules}/moment/min/moment.min.js"
							]
						},
						"bundle": {
							"scripts": "{$config.output}/js/dependency/moment/moment.js"
						}
					}
				}
			}
		},
		"app": {
			"base": {
				"src": {
					"styles": [
						"{$config.path.src}/scss/app.core.scss"
					],
					"scripts": [
						"{$config.path.src}/js/_config/app.config.js",
						"{$config.path.src}/js/_modules/app.navigation.js",
						"{$config.path.src}/js/_modules/app.menu.slider.js",
						"{$config.path.src}/js/_modules/app.init.js",
						"{$config.path.src}/js/_modules/app.resize.trigger.js",
						"{$config.path.src}/js/_modules/app.scroll.trigger.js",
						"{$config.path.src}/js/_modules/app.domReady.js",
						"{$config.path.src}/js/_modules/app.orientationchange.js",
						"{$config.path.src}/js/_modules/app.window.load.js",
						"{$config.path.src}/js/_config/app.colors.js"
						
					]
				},
				"bundle": {
					"styles": "{$config.output}/css/app.bundle.css",
					"scripts": "{$config.output}/js/app.bundle.js"
				}
			},
			"custom": {
				"auth" : {
					"login" : {
						"src": {
							"styles":[
								"{$config.path.src}/content/pages/page_login_alt/page-login-alt.scss"
							]
						},
						"bundle": {
							"styles": "{$config.output}/css/page-login-alt.css"
						}
					}
				},
				"invoice" : {
					"src": {
						"styles":[
							"{$config.path.src}/content/pages/page_invoice/page-invoice.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/page-invoice.css"
					}
				}
			},
			"demo": {
				"theme": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/theme-demo.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/theme-demo.css"
						
					}
				}
			},
			"themes": {
				"theme-1": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-1.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-1.css"
						
					}
				},
				"theme-2": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-2.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-2.css"
						
					}
				},
				"theme-3": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-3.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-3.css"
						
					}
				},
				"theme-4": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-4.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-4.css"
						
					}
				},
				"theme-5": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-5.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-5.css"
						
					}
				},
				"theme-6": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-6.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-6.css"
						
					}
				},
				"theme-7": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-7.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-7.css"
						
					}
				},
				"theme-8": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-8.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-8.css"
						
					}
				},
				"theme-9": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-9.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-9.css"
						
					}
				},
				"theme-10": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-10.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-10.css"
						
					}
				},
				"theme-11": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-11.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-11.css"
						
					}
				},
				"theme-12": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-12.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-12.css"
						
					}
				},
				"theme-13": {
					"src": {
						"styles": [
							"{$config.path.src}/scss/_themes/cust-theme-13.scss"
						]
					},
					"bundle": {
						"styles": "{$config.output}/css/themes/cust-theme-13.css"
						
					}
				}
			}           
		}           
	}
}           </pre>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:260px">
                                                    variable
                                                </th>
                                                <th style="width: 100px">
                                                    value
                                                </th>
                                                <th>
                                                    description
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    config.debug
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    spits out debugging data and error messages on npm log file
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.data.*
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    global data for the template, control profile images, user names, etc
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.jsUglify
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    minifies all javascript files in the project
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.cssMinify
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    minifies all css files in the project
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.jsSourcemaps
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    generates js source maps from the scss files for easier debugging options using the browser's inspection tool
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.cssSourcemaps
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    generates css source maps from the scss files for easier debugging options using the browser's inspection tool
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.autoprefixer
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    we recommend you leave this set to true. This will auto-generate all the necessary CSS browser prefixes for different browser types
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.compile.seedOnly
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    generates the seed project navigation menu, all other assets will be intact, can be removed manually (but will not be called into the main project)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    config.path.*
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    addresses source and dist path of your porject files, change this if you change your source file path
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    build.vendor.*
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    link all sources for plugins from the node_modules directory, you can concatinte files here and also rename them if needed
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    build.app.*
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    concatinates all the main core files for the theme
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Configuration JS (app.config.js) <a href="javascript:void(0);" name="app.config.js"></a>
                                    <small>
                                        Your <code>app.config.js</code> mainly controls the behaviour of your application, you can configure the navigation speed, disable visual effects, and change localstorage settings. To learn more about app configuration and how it works, check out the <a href="plugin_appcore.html" class="fw-500" title="app.core.js">app.core.js</a> page
                                    </small>
                                </h2>
                                <div class="fw-500 mb-1">
                                    File app.config.js contents
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint fs-md mb-0" style="max-height: 250px;">
var myapp_config = {
 VERSION: '4.5.1',
 root_: $('body'), // used for core app reference
 root_logo: $('.page-sidebar > .page-logo'), // used for core app reference
 throttleDelay: 450, // for window.scrolling & window.resizing
 filterDelay: 150,   // for keyup.functions 
 thisDevice: null, // desktop or mobile
 isMobile: (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase())), //popular device types available on the market
 mobileMenuTrigger: null, // used by pagescrolling and appHeight script, do not change!
 mobileResolutionTrigger: 992, //the resolution when the mobile activation fires
 isWebkit: ((!!window.chrome && !!window.chrome.webstore) === true || Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0 === true),
 isChrome: (/chrom(e|ium)/.test(navigator.userAgent.toLowerCase())),
 isIE: ( (window.navigator.userAgent.indexOf('Trident/') ) > 0 === true ),
 debugState: true, // outputs debug information on browser console
 rippleEffect: true, // material design effect that appears on all buttons
 mythemeAnchor: '#mytheme',
 activateLastTab: true,  
 navAnchor: $('#js-primary-nav'), //changing this may implicate slimscroll plugin target
 navHooks: $('#js-nav-menu'), //changing this may implicate CSS targets
 navAccordion: true, //nav item when one is expanded the other closes
 navInitalized: 'js-nav-built', //nav finished class 
 navFilterInput: $('#nav_filter_input'), //changing this may implicate CSS targets
 navHorizontalWrapperId: 'js-nav-menu-wrapper',
 navSpeed: 500, //ms
 mythemeColorProfileID: $('#js-color-profile'),
 navClosedSign: 'fal fa-angle-down',
 navOpenedSign: 'fal fa-angle-up',
 appIconPrefix: 'fal',
 appDateHook: $('.js-get-date'),
 storeLocally: true,
 /*
 * Used with initApp.loadScripts
 * DOC: Please leave it blank
 */
 jsArray : []
};      </pre>
                                </div>
                                <div class="fw-500 mb-1">
                                    Config file definition
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:260px">
                                                    variable
                                                </th>
                                                <th style="width: 100px">
                                                    value
                                                </th>
                                                <th>
                                                    description
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    myapp_config.VERSION
                                                </td>
                                                <td>
                                                    <code>integer</code>
                                                </td>
                                                <td>
                                                    application version number
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.root_
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    used for core app reference
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.root_logo
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    used for core app reference to detect logo click behaviour
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.throttleDelay
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    for window.scrolling & window.resizing
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.filterDelay
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    keyup.functions for the search filter
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.mobileResolutionTrigger
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    the resolution when the mobile activation fires
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.debugState
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    outputs debug information on browser console
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.rippleEffect
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    global configuration for material design effect that appears on all buttons
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.mythemeAnchor
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    this anchor is created dynamically and CSS is loaded as an override theme
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.navAnchor
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    this is the root anchor point where the menu script will begin its build
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.navAccordion
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    nav item when one is expanded the other closes
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.navSpeed
                                                </td>
                                                <td>
                                                    <code>integer</code>
                                                </td>
                                                <td>
                                                    the rate at which the menu expands revealing child elements on click, lower rate reels faster expansion of nav childs
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.navClosedSign
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    main navigation's collapse icon
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.navOpenedSign
                                                </td>
                                                <td>
                                                    <code>string</code>
                                                </td>
                                                <td>
                                                    main navigation's expand icon
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    myapp_config.storeLocally
                                                </td>
                                                <td>
                                                    <code>boolean</code>
                                                </td>
                                                <td>
                                                    saveSettings to localStorage, to store settings to a DB instead of LocalStorage use initApp.pushSettings("className1 className2")
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Layout Options <a href="javascript:void(0);" name="applayouts"></a>
                                    <small>
                                        SmartAdmin WebApp has over 285 layout combinations, you can check them out at <a href="settings_layout_options.html" class="fw-500">Layout Options</a> page.
                                    </small>
                                </h2>
                                <p class="panel-tag">
                                    You can also try them out through the <a href="#" class="fw-500" data-toggle="modal" data-target=".js-modal-settings"><i class="fal fa-cog"></i> Settings Panel</a>. The classes comes with 3 unique prefixes, <code>.header-*</code>, <code>.nav-*</code>, and <code>.mod-*</code>. You can also save your state settings to your database using <code>initApp.pushSettings()</code> and <code> initApp.getSettings()</code> methods, more info found in the <a href="settings_saving_db.html" class="fw-500">Saving to Database</a> page.
                                </p>
                                <p class="fw-500">
                                    Add the following classes to your <code>body</code> tag in order to see the effect. You may need to clear your <code>localStorage</code> first if you intend to add it manually.
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:260px">
                                                    class name
                                                </th>
                                                <th>
                                                    description
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <code>.header-function-fixed</code>
                                                </td>
                                                <td>
                                                    header is in a fixed position at all times, effecting mobile & desktop view
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-function-fixed</code>
                                                </td>
                                                <td>
                                                    Left panel position becomes fixed, activates custom scroll plugin
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-function-minify</code>
                                                </td>
                                                <td>
                                                    Navigation text are collapsed. Only visible portion are the icons. Hover the icons to reveal any child elements
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-function-hidden</code>
                                                </td>
                                                <td>
                                                    Navigation is revealed upon user hovering the visible portion of the navigation
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-function-top</code>
                                                </td>
                                                <td>
                                                    Main navigation shifts to the top (horizontal nav)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-main-boxed</code>
                                                </td>
                                                <td>
                                                    Contain layout to 1200px max width. Some classes are not compatible with this setting
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-mobile-push</code>
                                                </td>
                                                <td>
                                                    Content panel pushed on menu reveal
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-mobile-no-overlay</code>
                                                </td>
                                                <td>
                                                    Removes mesh on menu reveal
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.nav-mobile-slide-out</code>
                                                </td>
                                                <td>
                                                    Content overlaps menu
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-bigger-font</code>
                                                </td>
                                                <td>
                                                    Fonts are bigger for readability
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-high-contrast</code>
                                                </td>
                                                <td>
                                                    4.5:1 text contrast ratio to meet WCAG 2 AA standards
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-color-blind</code>
                                                </td>
                                                <td>
                                                    Color vision deficiency (this is a progressive UI option)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-pace-custom</code>
                                                </td>
                                                <td>
                                                    Preloader will be inside content
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-clean-page-bg</code>
                                                </td>
                                                <td>
                                                    A white background for your webapp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-hide-nav-icons</code>
                                                </td>
                                                <td>
                                                    Hides navigation icons for a slick and clean look (some classes will be incompatible)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-disable-animation</code>
                                                </td>
                                                <td>
                                                    Disables css based animations
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-hide-info-card</code>
                                                </td>
                                                <td>
                                                    Hides info card from left panel
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-lean-subheader</code>
                                                </td>
                                                <td>
                                                    Distinguished page header
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <code>.mod-nav-link</code>
                                                </td>
                                                <td>
                                                    Clear breakdown of nav links (some options will be incompatble)
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Skins & Themes <a href="javascript:void(0);" name="skinsthemes"></a>
                                    <small>
                                        SmartAdmin WebApp contains over 10 pre-built CSS skins to choose from. All located inside <code>dist/css/themes</code> or you would like to edit the source, go to <code>src/scss/_themes</code>. The skin files generated are very lightweight, ranging from 10-20kb in size, which only contains the color overrides.
                                    </small>
                                </h2>
                                <h4>
                                    How to change theme colors
                                    <small>
                                        There are more than one way to change your skin or theme colors. Use any one of the following methods below:
                                    </small>
                                </h4>
                                <div class="fw-500 mb-1">
                                    <span class="color-info-500">Method 1:</span> Changing skins programatically via button action, add the following line to any clickable object. Remove <code>data-themesave</code> attribute if you do not plan to save the theme to localStorage.
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint m-0">data-action="theme-update" data-themesave="" data-theme="css/themes/cust-theme-1.css"</pre>
                                </div>
                                <div class="fw-500 mb-1">
                                    <span class="color-info-500">Method 2:</span> Changing skins manually, add the skin CSS file to your html <code>head</code>, it must be added after apps' main CSS files
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint m-0">
link rel="stylesheet" media="screen, print" href="css/vendors.bundle.css"
link rel="stylesheet" media="screen, print" href="css/app.bundle.css"           
link id="mytheme" rel="stylesheet" href="css/themes/cust-theme-1.css" <-- Theme CSS override</pre>
                                </div>
                                <div class="fw-500 mb-1">
                                    <span class="color-info-500">Method 3:</span> Changing skins programatically via script. <code>themeName</code> is the location of where your theme's CSS file is located including the full file name, path and extension. <code>themeSave</code> is to indicate if you wish to save this change to the <code>localStorage</code>.
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint m-0">
//initApp.updateTheme(themeName, themeSave);

//saves the theme
initApp.updateTheme('css/themes/cust-theme-1.css'); 

// does not save
initApp.updateTheme('css/themes/cust-theme-1.css', false);</pre>
                                </div>
                                <div class="height-1 mb-3"></div>
                                <h4>
                                    Theme Color references
                                    <small>
                                        Add the theme URL by following the steps above
                                    </small>
                                </h4>
                                <table class="table table-bordered mb-g">
                                    <thead>
                                        <tr>
                                            <td>
                                                Theme Name
                                            </td>
                                            <td>
                                                Theme URL
                                            </td>
                                            <td>
                                                Theme Colors
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                Default
                                            </td>
                                            <td>
                                                <code>base CSS</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-primary-500 rounded-circle"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-success-500 rounded-circle"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-danger-500 rounded-circle"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-warning-500 rounded-circle"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-info-500 rounded-circle"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 bg-fusion-500 rounded-circle"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Tapestry
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-1.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b56a9f"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc958"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#c139fd"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b8ff41"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#21e2f3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#505050"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Atlantis
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-2.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#9fcb3d"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc9b7"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#fd3995"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ffc241"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#2196F3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#444444"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Indigo
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-3.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#4679cc"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc9b7"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#fd3995"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ffc241"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#2196F3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#494949"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Dodger Blue
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-4.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#2198F3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#69FB13"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#FC1349"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#FF9A13"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#BB1BF4"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#434a51"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Tradewind
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-5.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#6ab5b4"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#85b86c"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b57d6a"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#e0d07e"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#8f6ab5"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#505050"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Cranberry
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-6.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#dd5293"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc9b7"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#fd3995"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ffc241"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#2196F3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#585858"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Oslo Gray
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-7.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#868e96"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc9b7"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b57d6a"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ffc241"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#2196F3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#4e4e4e"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Chetwode Blue
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-8.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#7c91df"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#93ff87"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ff8793"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ffbf87"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#90c7f2"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#6e6e6e"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Apricot
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-9.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#e59c6c"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#6c9be3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#e77070"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#ede267"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#cb6de3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:dimgray"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Blue Smoke
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-10.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#778c85"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#8eff37"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#af37ff"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#37ffa8"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#3787ff"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#424242"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Green Smoke
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-11.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#a2b077"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#7fd894"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#f88c71"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#e892d7"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#d9b5a3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#545454"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Wild Blue Yonder
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-12.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#7976b3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc958"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#c139fd"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b8ff41"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#21e2f3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#555555"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Emerald
                                            </td>
                                            <td>
                                                <code>css/themes/cust-theme-13.css</code>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#55ce5f"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#1dc958"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#c139fd"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#b8ff41"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#21e2f3"></span>
                                                    <span class="d-inline-block mx-1 mt-1 p-2 rounded-circle" style="background:#525252"></span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="height-1 mb-3"></div>
                                <h4>
                                    Generate your own unique Themes
                                    <small>
                                        You can generate any number of themes by following the instructions below.
                                    </small>
                                </h4>
                                <ol class="list-spaced">
                                    <li>
                                        <strong>Go over to <code>smartadmin-html-full\src\scss\_themes</code></strong>
                                    </li>
                                    <li>
                                        <strong>Create an empty file with <code>.scss</code> extension. Lets name your file <span class="text-success">'mytheme.scss'</span></strong>
                                    </li>
                                    <li>
                                        <strong>Open <code>cust-theme-1.scss</code> to take a look at the example of what we did.</strong>
                                    </li>
                                    <li>
                                        <strong>You can either copy from <code>cust-theme-1.scss</code> to your 'methemes.scss' file and change the color values, or you may open <code>variables.scss</code> file and copy over any values you wish to change. </strong>
                                        <br><br>
                                        <strong>For example: mytheme.scss</strong>
                                        <div class="border border-dark mb-g overflow-hidden rounded">
                                            <pre class="prettyprint mb-0">
/* #THEME COLOR (variable overrides)
========================================================================== */
$color-primary:                     #b56a9f;
$color-success:                     #1dc958;

/* #GLOBAL IMPORTS (You must not remove this!)
========================================================================== */
@import './src/scss/_imports/_theme-modules-import';

/* #My Unique Changes (you can also add CSS overrides below)
========================================================================== */
$nav-background:                    #ed1c34; //<-- my unique change here</pre>
                                        </div>
                                    </li>
                                    <li>
                                        <strong>Once done, re-run the <a href="#gulp">gulp build command</a> to generate your unique CSS skin. You can then use the methods above to load the new skin to your application.</strong>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Seed & Slim Projects <a href="javascript:void(0);" name="seedslim"></a>
                                    <small>
                                        SmartAdmin WebApp's slim and seed projects comes at a reduced functionality, where seed is only the barebone essentials to get the project up and running, slim offers much more reduced functionalities, CSS features. If the Full Project was a size of a potato, the Seed Project would be the size of potato wedges, and the Slim Project would be Lays thinly sliced potato chips.
                                    </small>
                                </h2>
                                <table class="table table-bordered table-hover table-striped m-0">
                                    <thead>
                                        <tr>
                                            <th>Feature</th>
                                            <th class="text-center"><span class="badge badge-danger width-5 fs-lg">Slim</span></th>
                                            <th class="text-center"><span class="badge badge-warning width-5 fs-lg">Seed</span></th>
                                            <th class="text-center"><span class="badge badge-info width-5 fs-lg">Full</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Bootstrap components</td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Dependencies</td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Core plugins</td>
                                            <td class="text-center">Partial*</td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Extension plugins</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>App Settings and Layouts</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Form Plugins</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Sample Pages</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Datatables</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Charts &amp; Statistics</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                        <tr>
                                            <td>Notifications & Other plugins</td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-times-circle fa-2x color-danger-800"></i></td>
                                            <td class="text-center"><i class="fal fa-check-circle fa-2x color-success-800"></i></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0" name="filestructure">
                                    File Structure <a href="javascript:void(0);" name="filestructure"></a>
                                    <small>
                                        This webapp toolkit comes with a flexible file structure that can be easily used for small to large scope projects. This section will explains app's file structure and how to adapt it to your project.
                                    </small>
                                </h2>
                                <ul class="fs-lg fw-500 list-style-none pl-2">
                                    <li>
                                        <i class="fad fa-folder-open color-warning-700"></i> smartadmin-html-full
                                        <ul>
                                            <li><i class="fad fa-folder color-warning-700"></i> build <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp;all the scripts for gulp</span></li>
                                            <li><i class="fad fa-folder color-warning-700"></i> dist <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; compiled HTML and assets</span></li>
                                            <li>
                                                <i class="fad fa-folder-open color-success-600"></i> src
                                                <ul>
                                                    <li><i class="fad fa-folder color-warning-700"></i> content <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; content for all pages</span></li>
                                                    <li>
                                                        <i class="fad fa-folder-open color-success-600"></i> custom
                                                        <ul>
                                                            <li><i class="fad fa-folder color-warning-800"></i> demo-data <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; data for demo pages and graphs</span></li>
                                                            <li><i class="fad fa-folder color-warning-700"></i> docs-data <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; data for plugins and documentation</span></li>
                                                            <li><i class="fad fa-folder color-warning-600"></i> lang <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; data for language files</span></li>
                                                            <li><i class="fad fa-folder color-warning-500"></i> media <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; video and sound files</span></li>
                                                            <li><i class="fad fa-folder color-warning-400"></i> plugins <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; scripts for all custom plugins and non-destructive manipulation</span></li>
                                                            <li><i class="fad fa-folder color-warning-300"></i> webfonts <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; all font icon files</span></li>
                                                        </ul>
                                                    </li>
                                                    <li><i class="fad fa-folder color-warning-700"></i> image <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; all image contents</span></li>
                                                    <li><i class="fad fa-folder color-warning-700"></i> js <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; core javascript contents</span></li>
                                                    <li>
                                                        <i class="fad fa-folder-open color-success-600"></i> scss
                                                        <ul>
                                                            <li><i class="fad fa-folder color-warning-800"></i> _extensions <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; customization for extended plugins</span></li>
                                                            <li><i class="fad fa-folder color-warning-700"></i> _imports <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; global and theme imports as a master file refernce</span></li>
                                                            <li><i class="fad fa-folder color-warning-600"></i> _mixins <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; scss mixins and shortclasses</span></li>
                                                            <li><i class="fad fa-folder color-warning-500"></i> _modules <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; SCSS modular components for the theme</span></li>
                                                            <li><i class="fad fa-folder color-warning-400"></i> _themes <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; theme files for various theme colors</span></li>
                                                            <li><i class="fad fa-folder color-warning-300"></i> ...</li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <i class="fad fa-folder-open color-success-600"></i> template
                                                        <ul>
                                                            <li><i class="fad fa-folder color-warning-700"></i> layouts <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; various hbs layout templates </span></li>
                                                            <li><i class="fad fa-folder color-warning-600"></i> include <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; hbs includes, such as head, body, nav, content area, etc </span></li>
                                                            <li><i class="fad fa-folder color-warning-500"></i> _helpers <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; hbs conditions </span></li>
                                                        </ul>
                                                    </li>
                                                    <li><i class="fad fa-file"></i> navigation.json <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; JSON file that auto generates nav.hbs file </span> </li>
                                                </ul>
                                            </li>
                                            <li><i class="fad fa-file"></i> build.json <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; structure of the entire project and file components, use this file to restructure your project files </span></li>
                                            <li><i class="fad fa-file"></i> package.json <span class="text-muted fs-sm fw-400">&nbsp; --- &nbsp; list of all npm packages for the app </span></li>
                                        </ul>
                                    </li>
                                    <li><i class="fad fa-folder color-warning-700"></i> smartadmin-html-seed</li>
                                    <li><i class="fad fa-folder color-warning-600"></i> smartadmin-html-slim</li>
                                    <li><i class="fad fa-folder color-warning-500"></i> tests</li>
                                </ul>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0" name="pluginreference">
                                    Plugin Reference & Dependency <a href="javascript:void(0);" name="pluginreference"></a>
                                    <small>
                                        Reference for all plugins within SmartAdmin WebApp
                                    </small>
                                </h2>
                                <p>
                                    All plugins are categorized into five (5) categories. <span class="badge bg-fusion-500 fs-nano my-1">DEPENDENCY</span> and <span class="badge badge-danger fs-nano my-1">CORE</span> are essential plugins, removing any of these plugins can cause the application to crash or become unstable. <span class="badge badge-success fs-nano my-1">EXTENSION</span> are refered to plugins that enhances the user experience, this could range from SmartPanels, SlimScroll, BootBox, etc. You are free to remove these plugins without crashing the application. <span class="badge badge-warning fs-nano my-1">RECOMMENDED</span> increases application's performance, removing this will not crash the application but users may experience delay in animation or delayed overall responses from the application. <span class="badge badge-primary fs-nano my-1">ADDON</span> are plugins added on top as a development need or requirement, you are free to add or delete any addons
                                </p>
                                <br>
                                <p class="panel-tag fw-500">
                                    To see all list of Core plugins for a barebone version please visit the <a href="plugin_faq.html" class="fw-500"> Plugin FAQ</a> page.
                                </p>
                                <div class="mb-g">
                                    <h4><i class="fal fa-exclamation text-danger"></i> Select a plugin from the list below for full documentation</h4>
                                    <p class="text-faded fs-nano">Disclaimer: Third party plugins are left unchanged, all third party plugins have limited support (to design elements only), and you must refer to the documentation via plugin's official website</p>
                                    <select class="js-plugins custom-select form-control" style="width:15rem;">
                                        <option value="">-- Select Plugin --</option>
                                    </select>
                                </div>
                                <div id="js-display" class="d-none">
                                    <h5 class="fw-700">
                                        <span class="js-plugin-name"></span>
                                    </h5>
                                    <p>
                                        <span class="js-plugin-description"></span>
                                    </p>
                                    <p>
                                        <strong>Documentation:</strong>
                                        <br>
                                        <a href="" class="js-plugin-url" target="_blank"></a>
                                    </p>
                                    <p>
                                        <strong>License:</strong>
                                        <br>
                                        <span class="js-plugin-license"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    RTL Support <a href="javascript:void(0);" name="rtlsupport"></a>
                                    <small>
                                        Right to left text support for SmartAdmin WebApp
                                    </small>
                                </h2>
                                <p>You can turn on your RTL support by enabling the RTL CSS, by adding the suffix <code>*-rtl.css</code> you can turn on your RTL support. You can also have RTL on by default through your build.json config file.</p>
                                <div class="fw-500 mb-1">
                                    Change via CSS from your HTML <code>head</code>
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint mb-0">
link rel="stylesheet" media="screen, print" href="css/vendors.bundle-rtl.css"  <-- just add the '-rtl' suffix
link rel="stylesheet" media="screen, print" href="css/app.bundle-rtl.css"</pre>
                                </div>
                                <div class="fw-500 mb-1">
                                    Change via Gulp and <code>build.json</code> file
                                </div>
                                <div class="border border-dark mb-g overflow-hidden rounded">
                                    <pre class="prettyprint mb-0">
"compile": {
  "jsUglify": false,
  "cssMinify": false,
  "jsSourcemaps": false,
  "cssSourcemaps": true,
  "autoprefixer": true,
  "seedOnly": false,
  "rtl": true <-- change to 'true'
},</pre>
                                </div>
                                <p class="fw-500 fs-md">Once done, save your changes and run your <a href="#gulp">gulp build command</a> to generate the new CSS files.</p>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Changing Component Colors <a href="javascript:void(0);" name="changingcomponentcolors"></a>
                                    <small>
                                        How to change component colors in SmartAdmin WebApp using Chrome's developer tools and Gulp
                                    </small>
                                </h2>
                                <div class="panel-tag">
                                    In this example, we will change the 'left panel' background color. For this example to work, you first need to make sure your <a href="#overview">gulp build</a> is working correctly and you have the following enabled from <code>build.json</code>
                                    <br><br>
                                    <span class="fw-500 font-italic">Inside your build.json file</span>
                                    <pre class="prettyprint mb-0 bg-transparent fs-sm">
"compile": {
  "jsUglify": false,
  "cssMinify": false,
  "jsSourcemaps": false,
  "cssSourcemaps": true, <-- change to 'true'
  "autoprefixer": true,
  "seedOnly": false,
  "rtl": false 
},
</pre>
                                </div>
                                <ol class="pl-3">
                                    <li>
                                        <span class="fw-500 mb-2 d-block">
                                            Load your website on the latest version of <a href="https://www.google.ca/chrome/" target="_blank"> Google Chrome </a> and press F12 to load the <a href="https://developers.google.com/web/tools/chrome-devtools/open" target="_blank"> developer toolkit </a>
                                        </span>
                                        <div class="row">
                                            <div class="col col-lg-9 col-xl-7">
                                                <div class="demo-window rounded height-sm mb-g">
                                                    <div class="demo-window-content">
                                                        <img src="img/demo/chromedevtools-1.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="fw-500 mt-4 mb-2 d-block">
                                            Click on Elements tab and then locate the DOM element (eg. <code>page-sidebar</code>) you wish to manipulate, once selected it will reveal the SCSS file from the CSS maps (to the right). Locate the reference for the CSS class (eg. <code>.page-sidebar</code>) to reveal the SCSS file name where these classes are residing. In this example below it is residing inside <code>_placeholder.scss</code> in line 29. Clicking on the file name as shown in the image below...
                                        </span>
                                        <div class="row">
                                            <div class="col col-lg-9 col-xl-7">
                                                <div class="demo-window rounded height-sm mb-g">
                                                    <div class="demo-window-content">
                                                        <img src="img/demo/chromedevtools-2.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="fw-500 mt-4 mb-2 d-block">
                                            When you open the <code>_placeholder.scss</code> file from the previous window, you will see the variable you need to change for the left navigation background color. In this example it will be <code>$nav-background</code>
                                        </span>
                                        <div class="row">
                                            <div class="col col-lg-9 col-xl-7">
                                                <div class="demo-window rounded height-sm mb-g">
                                                    <div class="demo-window-content">
                                                        <img src="img/demo/chromedevtools-3.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="fw-500 mt-4 mb-2 d-block">
                                            Open <code>\smartadmin-html-full\src\scss\_modules\variables.scss</code> and locate the key variable you wish to change, in this case we locate <code>$nav-background</code>, make sure to also change <code>$nav-background-shade</code> to your liking.
                                        </span>
                                        <div class="row">
                                            <div class="col col-lg-9 col-xl-7">
                                                <div class="demo-window rounded height-sm mb-g">
                                                    <div class="demo-window-content">
                                                        <img src="img/demo/chromedevtools-4.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="fw-500 mt-4 mb-2 d-block">
                                            Once done, save your changes and run your <a href="#gulp">gulp build command</a> to generate the new CSS files.
                                        </span>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Product Support <a href="javascript:void(0);" name="productsupport"></a>
                                    <small>
                                        Customer support for SmartAdmin WebApp
                                    </small>
                                </h2>
                                <p>All support questions related to HTML and/or CSS will be honored. Issues that are encountered on the Seed versions of specific flavors of SmartAdmin are covered by their <a href="intel_introduction.html" target="_blank">respective authors</a>, but will be limited to HTML and/or CSS issues. If you need assistance with a technical issue that is currently not covered by the FAQ, you will need to have purchased a Full license of that flavor and contact the respective author for further assistance. The Full version links will be added to the <a href="info_app_flavors.html" target="_blank">Flavors</a> page once they are made available.</p>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Browser Support <a href="javascript:void(0);" name="browsersupport"></a>
                                    <small>
                                        SmartAdmin WebApp supports all the browsers supported by the Bootstrap 4, which includes:
                                    </small>
                                </h2>
                                <ul class="list-spaced list-unstyled fs-lg">
                                    <li>
                                        <i class="fab fa-internet-explorer mr-2" style="color: #42c0fb"></i> IE10+
                                    </li>
                                    <li>
                                        <i class="fab fa-firefox mr-2" style="color: #fe820a"></i> Firefox (latest)
                                    </li>
                                    <li>
                                        <i class="fab fa-safari mr-2" style="color: #448aff"></i> Safari (latest)
                                    </li>
                                    <li>
                                        <i class="fab fa-chrome mr-2" style="color: #458bc2"></i> Chrome (latest)
                                    </li>
                                    <li>
                                        <i class="fab fa-opera mr-2" style="color: #ff0000"></i> Opera (latest)
                                    </li>
                                </ul>
                                <p>
                                    <strong>Note: Certain pages and plugins are not supported with IE10, when this happens, we will display a message in your IE10 browser to notify the user.</strong>
                                </p>
                            </div>
                        </div>
                        <div class="card mb-g p-2">
                            <div class="card-body">
                                <h2 class="fw-700 m-0">
                                    Components <a href="javascript:void(0);" name="components"></a>
                                    <small>
                                        SmartAdmin WebApp comes with full documentation for all components
                                    </small>
                                </h2>
                                <p>
                                    Each component page has documentation of its usage and how they work. For all bootstrap components we have demonstrated its usage with examples for you to either copy from the HTML source or refer to the docs directly on bootstrap website.
                                </p>
                                <p class="font-weight-bold">
                                    To see documentation on a particular component please refer to the component page. For third party plugin documentation, you will need to refer to the website for the third party plugin, which can be located at the <a href="#pluginreference">Plugin Reference & Dependency</a> section.
                                </p>
                            </div>
                        </div>
                    </main>
                    <!-- this overlay is activated only when mobile menu is triggered -->
                    <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div> <!-- END Page Content -->
                    <!-- BEGIN Page Footer -->
                    <footer class="page-footer" role="contentinfo">
                        <div class="d-flex align-items-center flex-1 text-muted">
                            <span class="hidden-md-down fw-700">2020 © SmartAdmin by&nbsp;<a href='https://www.gotbootstrap.com' class='text-primary fw-500' title='gotbootstrap.com' target='_blank'>gotbootstrap.com</a></span>
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
            <input type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
            <label for="menu_open" class="menu-open-button ">
                <span class="app-shortcut-icon d-block"></span>
            </label>
            <a href="#" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Scroll Top">
                <i class="fal fa-arrow-up"></i>
            </a>
            <a href="page_login.html" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Logout">
                <i class="fal fa-sign-out"></i>
            </a>
            <a href="#" class="menu-item btn" data-action="app-fullscreen" data-toggle="tooltip" data-placement="left" title="Full Screen">
                <i class="fal fa-expand"></i>
            </a>
            <a href="#" class="menu-item btn" data-action="app-print" data-toggle="tooltip" data-placement="left" title="Print page">
                <i class="fal fa-print"></i>
            </a>
            <a href="#" class="menu-item btn" data-action="app-voice" data-toggle="tooltip" data-placement="left" title="Voice command">
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
                                <div class="w-100">
                                    <ul id="js-msgr-listfilter" class="list-unstyled m-0">
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
                                </div>
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
                                <div id="chat_container" class="w-100 p-4">
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
                                </div>
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
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl width-1 mr-1" data-toggle="tooltip" data-original-title="More options" data-placement="top">
                                        <i class="fal fa-ellipsis-v-alt color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Attach files" data-placement="top">
                                        <i class="fal fa-paperclip color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Insert photo" data-placement="top">
                                        <i class="fal fa-camera color-fusion-300"></i>
                                    </a>
                                    <div class="ml-auto">
                                        <a href="javascript:void(0);" class="btn btn-info">Send</a>
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
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-sm" data-target="html">
                                        <input type="radio" name="changeFrontSize"> SM
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text" data-target="html">
                                        <input type="radio" name="changeFrontSize" checked=""> MD
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-lg" data-target="html">
                                        <input type="radio" name="changeFrontSize"> LG
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-xl" data-target="html">
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
                                        <a href="#" id="myapp-0" data-action="theme-update" data-themesave data-theme="" data-toggle="tooltip" data-placement="top" title="Wisteria (base css)" data-original-title="Wisteria (base css)"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-1" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-1.css" data-toggle="tooltip" data-placement="top" title="Tapestry" data-original-title="Tapestry"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-2" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-2.css" data-toggle="tooltip" data-placement="top" title="Atlantis" data-original-title="Atlantis"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-3" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-3.css" data-toggle="tooltip" data-placement="top" title="Indigo" data-original-title="Indigo"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-4" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-4.css" data-toggle="tooltip" data-placement="top" title="Dodger Blue" data-original-title="Dodger Blue"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-5" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-5.css" data-toggle="tooltip" data-placement="top" title="Tradewind" data-original-title="Tradewind"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-6" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-6.css" data-toggle="tooltip" data-placement="top" title="Cranberry" data-original-title="Cranberry"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-7" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-7.css" data-toggle="tooltip" data-placement="top" title="Oslo Gray" data-original-title="Oslo Gray"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-8" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-8.css" data-toggle="tooltip" data-placement="top" title="Chetwode Blue" data-original-title="Chetwode Blue"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-9" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-9.css" data-toggle="tooltip" data-placement="top" title="Apricot" data-original-title="Apricot"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-10" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-10.css" data-toggle="tooltip" data-placement="top" title="Blue Smoke" data-original-title="Blue Smoke"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-11" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-11.css" data-toggle="tooltip" data-placement="top" title="Green Smoke" data-original-title="Green Smoke"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-12" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-12.css" data-toggle="tooltip" data-placement="top" title="Wild Blue Yonder" data-original-title="Wild Blue Yonder"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-13" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-13.css" data-toggle="tooltip" data-placement="top" title="Emerald" data-original-title="Emerald"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-14" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-14.css" data-toggle="tooltip" data-placement="top" title="Supernova" data-original-title="Supernova"></a>
                                    </li>
                                    <li>
                                        <a href="#" id="myapp-15" data-action="theme-update" data-themesave data-theme="css/themes/cust-theme-15.css" data-toggle="tooltip" data-placement="top" title="Hoki" data-original-title="Hoki"></a>
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
                                        <div id="skin-default" data-action="toggle-replace" data-replaceclass="mod-skin-light mod-skin-dark" data-class="" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-primary rounded overflow-hidden text-success js-waves-on" data-original-title="Default Mode" style="height: 80px">
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
                                        <div id="skin-light" data-action="toggle-replace" data-replaceclass="mod-skin-dark" data-class="mod-skin-light" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-secondary rounded overflow-hidden text-success js-waves-on" data-original-title="Light Mode" style="height: 80px">
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
                                        <div id="skin-dark" data-action="toggle-replace" data-replaceclass="mod-skin-light" data-class="mod-skin-dark" data-toggle="tooltip" data-placement="top" title="" class="d-flex bg-white border border-dark rounded overflow-hidden text-success js-waves-on" data-original-title="Dark Mode" style="height: 80px">
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
                                        <a href="#" class="btn btn-outline-danger fw-500 btn-block" data-action="app-reset">Reset Settings</a>
                                    </div>
                                    <div class="col-6 pl-1">
                                        <a href="#" class="btn btn-danger fw-500 btn-block" data-action="factory-reset">Factory Reset</a>
                                    </div>
                                </div>
                            </div>
                        </div> <span id="saving"></span>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Page Settings -->
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
        <script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
        <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
        <script>
            $(document).ready(function()
            {
                var jsdisplay = $('#js-display');
                var url = "media/data/plugin-reference.json";

                $.getJSON(url, function(data)
                {
                    $.each(data, function(index, value)
                    {
                        $('.js-plugins').append('<option value="' + value.plugin + '" data-description="' + value.description + '" data-url="' + value.url + '" data-license="' + value.license + '">' + value.plugin + '</option>');
                    });
                });

                // SHOW SELECTED VALUE.
                $('.js-plugins').change(function()
                {
                    var plugin = this.options[this.selectedIndex].text;
                    var url = $('select.js-plugins').find(':selected').data('url');
                    var license = $('select.js-plugins').find(':selected').data('license');
                    var description = $('select.js-plugins').find(':selected').data('description');

                    jsdisplay.removeClass().addClass('d-block')

                    $('.js-plugin-name').text(plugin);
                    $('.js-plugin-url').text(url);
                    $('.js-plugin-url').attr('href', url);
                    $('.js-plugin-license').text(license);
                    $('.js-plugin-description').text(description);
                });
            });

        </script>
    </body>
    <!-- END Body -->
</html>
