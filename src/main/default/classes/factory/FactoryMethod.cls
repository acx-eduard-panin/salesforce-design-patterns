public with sharing class FactoryMethod {
    //wrong
    public static void step1(String supportType) {
        if (supportType == 'ATM') {
            AtmPayment support = new AtmPayment();
            support.pay();
        } else if (supportType == 'PayPall') {
            PayPallPayment support = new PayPallPayment();
            support.pay();
        } else if (supportType == 'Online') {
            OnlinePayment support = new OnlinePayment();
            support.pay();
        } else {
            CashPayment support = new CashPayment();
            support.pay();
        }

    }

    /**
     * The code to instantiate concrete classes is still present at many locations
     * and will still require changes if a new support type is added.
     * If we can delegate the creation of concrete classes to some other class,
     * then our code will be completely independent of the existing code and new support types.
     */
    public static void step2(String supportType) {
        IPayment support = null;

        switch on supportType {
            when 'ATM' {
                support = new AtmPayment();
            }
            when 'PayPall' {
                support = new PayPallPayment();
            }
            when 'Online' {
                support = new OnlinePayment();
            } when else {
                support = new CashPayment();
            }
        }

        support.pay();
    }

    /**
     *  The problem with the preceding design is that whenever a new support type needs to be
     *  added, we need to add a condition to PaymentFactory.
     */
    public static void step3(String supportType) {
        IPayment support = PaymentFactory.getInstanceWrong(supportType);

        support.pay();
    }

    /**
     *  The problem with the preceding design is that whenever a new support type needs to be
     *  added, we need to add a condition to PaymentFactory.
     */
    public static void step4(String supportType) {
        IPayment payment = PaymentFactory.getInstance(supportType);
        payment.pay();
    }
}