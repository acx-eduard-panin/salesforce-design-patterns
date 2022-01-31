public with sharing class NumberExpression implements Expression {
    Integer index;
    List<String> values;
    public NumberExpression(String index, List<String> values) {
        this.index = Integer.valueOf(index) - 1;
        this.values = values;
    }
    public String interpret() {
        return values.get(index);
    }
}