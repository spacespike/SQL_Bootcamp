COMMENT ON TABLE person_discounts 
    IS 'Stores the personalized discount assigned to customers for different pizzerias.';

COMMENT ON COLUMN person_discounts.id 
    IS 'Primary key and unique id for each discount record.';

COMMENT ON COLUMN person_discounts.person_id 
    IS 'Foreign key, reference linking to the person table representing the customer.';

COMMENT ON COLUMN person_discounts.pizzeria_id 
    IS 'Foreign key, reference linking to the pizzeria table representing the restaurant.';

COMMENT ON COLUMN person_discounts.discount 
    IS 'The calculated discount in percent for the customer (must be between 0.00 and 100.00).';
