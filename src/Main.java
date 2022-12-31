import net.sf.clipsrules.jni.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Main {
    private DefaultListModel<String> defaultListModel;
    private JComboBox<String> querySelector;
    private JPanel panel;
    private JTextField inputTextField;
    private JButton runButton;
    private JTextArea outputText;
    private JList<String> instancesList;
    private final Environment clips;
    private final CaptureRouter router;

    Main() {
        this.clips = new Environment();
        this.router = new CaptureRouter(clips, new String[]{Router.STDOUT});
        try {
            clips.load("clips_src/classes.clp");
            clips.load("clips_src/instances.clp");
            clips.load("clips_src/rules.clp");
            clips.reset();
        } catch (CLIPSException e) {
            JOptionPane.showMessageDialog(panel, e.toString(), "Dialog",
                    JOptionPane.ERROR_MESSAGE);
        }

        this.runButton.addActionListener(e -> {
            try {
                clips.assertString("(query" + (querySelector.getSelectedIndex() + 1) + " [" + inputTextField.getText() + "])");
                clips.run();
                outputText.setText(router.getOutput());
                router.clear();
            } catch (CLIPSException ex) {
                JOptionPane.showMessageDialog(panel, e.toString(), "Dialog",
                        JOptionPane.ERROR_MESSAGE);
            }

        });

        this.instancesList.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                if (e.getClickCount() == 1) {
                    inputTextField.setText(instancesList.getSelectedValuesList().get(0));
                }
            }
        });
        defaultListModel.addAll(clips.getInstanceList().stream().map(FactInstance::getName).toList());
    }

    private void createUIComponents() {
        String[] queries = {
                "Get all TAs belonging to a department.",
                "Get the courses a student is currently studying.",
                "Get all the courses offered by a certain faculty.",
                "Get Lecturers of a faculty.",
                "Get all faculties of a university.",
        };
        this.querySelector = new JComboBox<>(queries);
        defaultListModel = new DefaultListModel<>();
        instancesList = new JList<>(defaultListModel);
    }

    public static void main(String[] args){
        JFrame frame = new JFrame("Semantic Web Project");
        frame.setContentPane(new Main().panel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setMinimumSize(new Dimension(640, 250));
        frame.setResizable(false);
        frame.pack();
        frame.setLocationByPlatform(true);
        frame.setVisible(true);
    }

}
