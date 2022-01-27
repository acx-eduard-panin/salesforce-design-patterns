public with sharing class PaymentFactory {
    private static final String INTERFACE_NAME = 'implements IPayment';
    private static final String NO_REALIZATION = 'This type does not have realization of payment process';
    /**
     * Reflection in Apex
     */
    public static IPayment getInstanceMTD(String supportType) {
        Map<String, String> mapping = getPaymentMapping();
        if (!mapping.containsKey(supportType)) {
            throw new PaymentException(NO_REALIZATION);
        }

        Type paymentType = Type.forName(mapping.get(supportType));

        return (IPayment)paymentType.newInstance();
    }

    /**
    * Dynamic classes Apex
    */
    public static IPayment getInstanceDynamicQuery(String supportType) {
        List<ApexClass> classes = (List<ApexClass>)[FIND :INTERFACE_NAME IN ALL FIELDS RETURNING ApexClass(Name)][0];
        for (ApexClass apexClass : classes) {
            Type paymentType = Type.forName(apexClass.Name);
            if (paymentType == null) {
                continue;
            }
            IPayment payment;
            try {
                payment = (IPayment) paymentType.newInstance();
            } catch (TypeException ex) {
                continue;
            }
            if (payment.getType() == supportType) {
                return payment;
            }
        }

        throw new PaymentException(NO_REALIZATION);
    }

    private static Map<String, String> getPaymentMapping() {
        Map<String, String> result = new Map<String, String>();
        for (PaymentTypeInfo__mdt paymentTypeInfo : PaymentTypeInfo__mdt.getAll().values()) {
            result.put(paymentTypeInfo.PaymentType__c, paymentTypeInfo.ClassName__c);
        }

        return result;
    }

    public static IPayment getInstanceSimple(String supportType) {
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
            }
            when else {
                support = new CashPayment();
            }
        }

        return support;
    }
}