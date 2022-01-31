public with sharing class Context {
    public List<String> values = new List<String>();
    public String input;


    public Expression evaluate(String input, List<String> values) {
        String currentInput = input.replace(' ', '');
        Integer pos = currentInput.length() - 1;
        List<String> parts = currentInput.split('');

        while (pos > 0) {
            if (parts[pos].isNumeric()) {
                pos --;
            } else {
                Expression left = evaluate(currentInput.substring(0, pos), values);
                Expression right = new NumberExpression(currentInput.substring(pos+1, currentInput.length()), values);
                switch on parts[pos] {
                    when '|' {
                        return new OrExpression(left, right);
                    }
                    when '&' {
                        return new AndExpression(left, right);
                    }
                }
            }
        }
        return new NumberExpression(input, values);
    }
}