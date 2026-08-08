package com.cognizant;

import com.cognizant.model.Country;
import com.cognizant.service.CountryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class OrmLearnApplication {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(OrmLearnApplication.class);

    private static CountryService countryService;

    public static void main(String[] args) {

        ApplicationContext context =
                SpringApplication.run(OrmLearnApplication.class, args);

        countryService = context.getBean(CountryService.class);

        LOGGER.info("Inside Main");

        testGetAllCountries();

        testGetCountry();

        testAddCountry();

    }

    private static void testGetAllCountries() {

        LOGGER.info("----- All Countries -----");

        List<Country> countries = countryService.getAllCountries();

        LOGGER.info("{}", countries);

    }

    private static void testGetCountry() {

        LOGGER.info("----- Find Country -----");

        Country country = countryService.getCountry("IN");

        LOGGER.info("{}", country);

    }

    private static void testAddCountry() {

        LOGGER.info("----- Add Country -----");

        Country country = new Country();

        country.setCode("JP");
        country.setName("Japan");

        countryService.addCountry(country);

        LOGGER.info("Country Added Successfully");

        LOGGER.info("Updated Country List:");

        List<Country> countries = countryService.getAllCountries();

        LOGGER.info("{}", countries);

    }

}