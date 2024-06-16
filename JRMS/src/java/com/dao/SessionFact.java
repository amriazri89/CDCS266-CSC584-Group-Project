package com.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry; 
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class SessionFact {
    private static SessionFactory sessionFactory;
    private static ServiceRegistry serviceRegistry;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            Configuration configuration = new Configuration();
            configuration.configure("/hibernate.cfg.xml");
            serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            System.out.println("SessionFactory built successfully.");
        }
        return sessionFactory;
    }
}
