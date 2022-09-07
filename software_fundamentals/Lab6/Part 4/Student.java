public class Student extends Person {
    private String program;

    private Staff advisor;
    private Project project;

    Student(String n, int id, String ph, String e) {
        super(n, id, ph, e);
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getProgram() {
        return program;
    }

    public void setAdvisor(Staff advisor) {
        this.advisor = advisor;
    }

    public String getAdvisorName() {
        return advisor.name;
    }

    public String getAdvisorPosition() {
        return advisor.position;
    }

    public String getProjectTitle() {
        return project.getTitle();
    }

    public String getProjectArea() {
        return project.getArea();
    }

}
