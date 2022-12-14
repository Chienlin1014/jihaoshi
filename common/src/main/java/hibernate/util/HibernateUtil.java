package hibernate.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {
    	// registry
    	final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        try {
        	// create SessionFactory
        	sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
//            sessionFactory = new Configuration().buildSessionFactory();
        } catch (Throwable ex) {
        	// The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
    		// so destroy it manually.
        	StandardServiceRegistryBuilder.destroy(registry);
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}