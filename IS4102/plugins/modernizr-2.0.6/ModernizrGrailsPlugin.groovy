class ModernizrGrailsPlugin {
    // the plugin version
    def version = "2.0.6"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "1.3 > *"
    // the other plugins this plugin depends on
    def dependsOn = [:]
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
        "grails-app/views/error.gsp"
    ]

    // TODO Fill in these fields
    def title = "Modernizr for Grails" // Headline display name of the plugin
    def author = "Konstantinos Kostarellis"
    def authorEmail = "kosta.grails@gmail.com"
    def description = '''\
Plugin that provides the JavaScript library Modernizr. Modernizr helps you build the next generation of HTML5 and CSS3-powered websites.
It integrates nicely with the resources plugin.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/modernizr"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
    def license = "APACHE"

    // Location of the plugin's issue tracker.
   def issueManagement = [ system: "GITHUB", url: "https://github.com/delight/grails-modernizr/issues" ]

    // Online location of the plugin's browseable source code.
    def scm = [ url: "https://github.com/delight/grails-modernizr" ]

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before
    }

    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }

    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }

    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)
    }

    def onChange = { event ->
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }

    def onShutdown = { event ->
        // TODO Implement code that is executed when the application shuts down (optional)
    }
}
