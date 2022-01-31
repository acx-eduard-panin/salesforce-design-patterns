public with sharing class ClassNameUtil {
    private static final String CLASS_NAME = ClassNameUtil.class.getName();
    private static final Pattern STACK_LINE = Pattern.compile('^(?:Class\\.)?([^.]+)\\.?([^\\.\\:]+)?[\\.\\:]?([^\\.\\:]*): line (\\d+), column (\\d+)$');

    public static String getLocation() {
        List<String> stacktrace = new DmlException().getStackTraceString().split('\n');

        for (String line : stacktrace) {
            Matcher matcher = STACK_LINE.matcher(line);

            if (matcher.find() && !line.startsWith('Class.' + CLASS_NAME + '.')) {
                return matcher.group(1);
            }
        }

        return 'No class Name';
    }

}