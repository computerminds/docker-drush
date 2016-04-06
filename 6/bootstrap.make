core = 7.x
api = 2

; Drupal core.
projects[drupal][type] = core

projects[admin_menu][subdir] = "contrib"
projects[admin_views][subdir] = "contrib"
projects[bean][subdir] = "contrib"
projects[backup_migrate][subdir] = "contrib"
projects[eva][subdir] = "contrib"
projects[ctools][subdir] = "contrib"
projects[date][subdir] = "contrib"
projects[diff][subdir] = "contrib"
projects[devel][subdir] = "contrib"
projects[entity][subdir] = "contrib"
projects[entitycache][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[field_collection][subdir] = "contrib"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[libraries][subdir] = "contrib"
projects[link][subdir] = "contrib"
projects[mailsystem][subdir] = "contrib"
projects[paragraphs][subdir] = "contrib"
projects[robotstxt][subdir] = "contrib"
projects[securepages][subdir] = "contrib"
projects[strongarm][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[varnish][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[views_bulk_operations][subdir] = "contrib"
projects[views_data_export][subdir] = "contrib"
projects[webform][subdir] = "contrib"
projects[xmlsitemap][subdir] = "contrib"

; We often have mpdf
libraries[mpdf][download][type] = "get"
libraries[mpdf][download][url] = "https://github.com/finwe/mpdf/archive/v6.0.0.zip"
libraries[mpdf][directory_name] = "mpdf"
