import net.sf.clipsrules.jni.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Main {
    private DefaultListModel<String> defaultListModel;
    private JComboBox<String> querySelector;
    private JPanel panel;
    private JLabel inputLabelName;
    private JTextField inputTextField;

    private JButton runButton;
    private JTextArea outputText;
    private JList<String> instancesList;
    private String runInput;
    private Environment clips;
    private CaptureRouter router;
    Main()  {

        this.clips = new Environment();
        this.router  = new CaptureRouter(clips, new String[] {Router.STDOUT});
        System.out.println("Loading Classes, Instances and Rules to working memory");
        try {
            clips.load("classes.clp");
            System.out.println("Loaded classes.clp");
            clips.load("instances.clp");
            System.out.println("Loaded instances.clp");
            clips.load("rules.clp");
            System.out.println("Loaded rules.clp");
            System.out.println("Finished Loading");
            clips.reset();
            System.out.println();
        } catch (CLIPSException e) {
            throw new RuntimeException(e);
        }

        this.runButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    //(query1 [input])
                    clips.assertString("(query"+(querySelector.getSelectedIndex()+1)+" ["+inputTextField.getText()+"])");
                    clips.run();

                    outputText.setText(router.getOutput());
                    router.clear();
                } catch (CLIPSException ex) {
                    throw new RuntimeException(ex);
                }

            }
        });
        this.instancesList.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                if(e.getClickCount()==1){
                    inputTextField.setText(instancesList.getSelectedValuesList().get(0));
                }
            }
        });
        defaultListModel.addAll(clips.getInstanceList().stream().map(FactInstance::getName).toList());
    }
    public static void main(String[] args) throws CLIPSException {


        JFrame f = new JFrame("Semantic Web Project");
        f.setContentPane(new Main().panel);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setMinimumSize(new Dimension(500,250));
        f.setResizable(false);
        f.pack();
        f.setLocationByPlatform(true);
        f.setVisible(true);


    }

    private void createUIComponents() {

        String[] queries ={
            "Get all TAs belonging to a department.",
            "Get the courses a student is currently studying.",
            "Get all the courses offered by a certain faculty.",
            "Get Lecturers of a faculty.",
            "Get all faculties of a university.",
        };
        this.querySelector = new JComboBox<>(queries);
        defaultListModel = new DefaultListModel<>();
        instancesList=new JList<>(defaultListModel);

    }
}
