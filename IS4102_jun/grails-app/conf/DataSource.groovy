 import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration

   dataSource {
       configClass = GrailsAnnotationConfiguration.class
   	   pooled = false
   	   driverClassName = "com.mysql.jdbc.Driver"
   	   username = "root"
   	   password =  ""
   	   dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
   }
   hibernate {
       cache.use_second_level_cache=true
       cache.use_query_cache=true
       cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
   }
   // environment specific settings
   environments {
   	development {
   		dataSource {
   			dbCreate = "update" // one of 'create', 'create-drop','update'
   			url = "jdbc:mysql://localhost:3306/khronosun_new?autoreconnect=true"
   		}
   	}
   	test {
   		dataSource {
   			dbCreate = "update"
   			url = "jdbc:mysql://localhost:3306/khronosun_new?autoreconnect=true"
   		}
   	}
   	production {
   		dataSource {
   			dbCreate = "update"
   			url = "jdbc:mysql://localhost:3306/khronosun_new?autoreconnect=true"
   		}
   	}
   }