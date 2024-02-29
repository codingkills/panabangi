import javax.swing.*;
import java.awt.*;
import javax.swing.border.EmptyBorder;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener; 

public class TVESpecializationGuide extends JFrame implements ActionListener {
    private JTextField nameField;
    private JComboBox<String> specializationComboBox;
    private ButtonGroup objectiveGroup;
    
    public TVESpecializationGuide() {
        setTitle("TVE Specialization Guide");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(770, 500); 
        setLocationRelativeTo(null); 

        getContentPane().setBackground(Color.BLACK);

        JPanel backgroundPanel = new JPanel(new GridLayout(0, 1, 0, 20));
        backgroundPanel.setBorder(new EmptyBorder(20, 20, 20, 20)); 
        backgroundPanel.setBackground(Color.DARK_GRAY); 

        JPanel titlePanel = new JPanel(new GridLayout(3, 1)); 
        JLabel titleLabel1 = new JLabel("TVE");
        JLabel titleLabel2 = new JLabel("Specialization");
        JLabel titleLabel3 = new JLabel("Guide");
        titleLabel1.setFont(new Font("Arial", Font.BOLD, 33)); 
        titleLabel2.setFont(new Font("Arial", Font.BOLD, 33)); 
        titleLabel3.setFont(new Font("Arial", Font.BOLD, 33)); 
        titleLabel1.setHorizontalAlignment(SwingConstants.CENTER); 
        titleLabel2.setHorizontalAlignment(SwingConstants.CENTER); 
        titleLabel3.setHorizontalAlignment(SwingConstants.CENTER); 
        titleLabel1.setForeground(Color.WHITE); 
        titleLabel2.setForeground(Color.WHITE); 
        titleLabel3.setForeground(Color.WHITE); 
        titlePanel.setBackground(Color.DARK_GRAY); 
        titlePanel.add(titleLabel1);
        titlePanel.add(titleLabel2);
        titlePanel.add(titleLabel3);
        backgroundPanel.add(titlePanel);

        JPanel inputPanel = new JPanel(new GridLayout(0, 2, 10, 10));
        inputPanel.setBackground(Color.DARK_GRAY); 
        inputPanel.setOpaque(true); 
        
        JLabel nameLabel = new JLabel("Name:");
        nameLabel.setFont(new Font("Arial", Font.BOLD, 20)); 
        nameLabel.setForeground(Color.WHITE); 
        inputPanel.add(nameLabel);

        nameField = new JTextField();
        inputPanel.add(nameField);

        JLabel specializationLabel = new JLabel("Choose a Specialization:");
        specializationLabel.setFont(new Font("Arial", Font.BOLD, 20)); 
        specializationLabel.setForeground(Color.WHITE); 
        inputPanel.add(specializationLabel);

        specializationComboBox = new JComboBox<>(new String[]{"Electricity", "Masonry", "Carpentry", "Cookery", "Garments", "Plumbing"});
        inputPanel.add(specializationComboBox);

        backgroundPanel.add(inputPanel);

        JPanel objectivePanel = new JPanel(new BorderLayout());
        JLabel objectiveLabel = new JLabel("Choose an Objective:");
        objectiveLabel.setFont(new Font("Arial", Font.BOLD, 25)); 
        objectiveLabel.setHorizontalAlignment(SwingConstants.CENTER); 
        objectiveLabel.setForeground(Color.WHITE); 
        objectivePanel.setBackground(Color.DARK_GRAY); 

        JPanel radioPanel = new JPanel(new GridLayout(0, 2));
        radioPanel.setBackground(Color.DARK_GRAY); 
        objectiveGroup = new ButtonGroup();
        JRadioButton objectiveARadioButton = new JRadioButton("Specialization Review");
        JRadioButton objectiveBRadioButton = new JRadioButton("Mentorship");
        JRadioButton objectiveCRadioButton = new JRadioButton("Skills Assessment and Gap Analysis");
        objectiveARadioButton.setFont(new Font("Arial", Font.PLAIN, 20));
        objectiveBRadioButton.setFont(new Font("Arial", Font.PLAIN, 20)); 
        objectiveCRadioButton.setFont(new Font("Arial", Font.PLAIN, 20)); 
        objectiveARadioButton.setForeground(Color.WHITE); 
        objectiveBRadioButton.setForeground(Color.WHITE); 
        objectiveCRadioButton.setForeground(Color.WHITE); 
        objectiveARadioButton.setBackground(Color.DARK_GRAY); 
        objectiveBRadioButton.setBackground(Color.DARK_GRAY); 
        objectiveCRadioButton.setBackground(Color.DARK_GRAY); 
        objectiveARadioButton.setActionCommand("Specialization Review");
        objectiveBRadioButton.setActionCommand("Mentorship");
        objectiveCRadioButton.setActionCommand("Skills Assessment and Gap Analysis");
        objectiveGroup.add(objectiveARadioButton);
        objectiveGroup.add(objectiveBRadioButton);
        objectiveGroup.add(objectiveCRadioButton);
        radioPanel.add(objectiveARadioButton);
        radioPanel.add(objectiveBRadioButton);
        radioPanel.add(objectiveCRadioButton);

        objectivePanel.add(objectiveLabel, BorderLayout.NORTH);
        objectivePanel.add(radioPanel, BorderLayout.CENTER);
        backgroundPanel.add(objectivePanel);

        
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        JButton nextButton = new JButton("Next");
        nextButton.addActionListener(this); 
        nextButton.setBackground(Color.BLACK); 
        nextButton.setForeground(Color.WHITE); 
        buttonPanel.setBackground(Color.DARK_GRAY); 
        buttonPanel.add(nextButton); 
        backgroundPanel.add(buttonPanel); 

        add(backgroundPanel);

        setVisible(true);
    }

    private void displayDescription(String description) {
        JFrame descriptionFrame = new JFrame();
        descriptionFrame.setTitle("Specialization Description");
        descriptionFrame.setSize(800, 600);
        descriptionFrame.setLocationRelativeTo(null);

        JTextArea descriptionArea = new JTextArea(description);
        descriptionArea.setFont(new Font("Arial", Font.PLAIN, 18)); 
        descriptionArea.setLineWrap(true);
        descriptionArea.setWrapStyleWord(true);
        descriptionArea.setEditable(false);

        JScrollPane scrollPane = new JScrollPane(descriptionArea);
        descriptionFrame.add(scrollPane);

        descriptionFrame.setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
   
        if (e.getActionCommand().equals("Next")) {
            String name = nameField.getText();
            String specialization = (String) specializationComboBox.getSelectedItem();
            String selectedObjective = "";
            if (objectiveGroup.getSelection() != null) {
                selectedObjective = objectiveGroup.getSelection().getActionCommand();
            }

        
            if ("Specialization Review".equals(selectedObjective)) {
                switch (specialization) {
                    case "Electricity":
                        displayDescription("Electricity Specialization Description:\n\n" +
                                "The Electricity specialization focuses on equipping individuals with the knowledge and skills necessary to work with electrical systems and components. In this specialization, students delve into concepts related to electrical circuits, power distribution, wiring, and safety protocols. Emphasizing hands-on training, students gain practical experience in installing, troubleshooting, and maintaining electrical systems.\n\n" +
                                "Real-world applications of the Electricity specialization span across various industries, including construction, manufacturing, renewable energy, telecommunications, and infrastructure development. Electricians play a vital role in ensuring the functionality and safety of electrical systems in buildings, factories, power plants, and communication networks.\n\n" +
                                "Industry relevance is a key aspect of the Electricity specialization, as skilled electricians are in high demand across diverse sectors. The knowledge and expertise acquired in this specialization are essential for addressing contemporary challenges such as sustainable energy practices, technological advancements in electrical systems, and safety regulations compliance.\n\n" +
                                "By providing comprehensive reviews of the Electricity specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in the electrical trades within the Technical and Vocational Education (TVE) field.");
                        break;
                    case "Masonry":
                        displayDescription("Masonry Specialization Description:\n\n" +
                                "The Masonry specialization focuses on developing expertise in the construction and maintenance of structures using materials such as bricks, stones, and concrete. Students in this specialization learn various techniques for laying, bonding, and finishing masonry units to create durable and aesthetically pleasing structures.\n\n" +
                                "Real-world applications of the Masonry specialization encompass a wide range of construction projects, including residential buildings, commercial complexes, infrastructure projects, and historical restoration efforts. Masons play a crucial role in shaping the physical landscape by constructing walls, foundations, pavements, and architectural features that withstand the test of time.\n\n" +
                                "Industry relevance is paramount in the Masonry specialization, as skilled masons are in demand across the construction industry. The knowledge and skills acquired in this specialization are essential for meeting the evolving needs of the construction sector, including advancements in building materials, techniques, and sustainability practices.\n\n" +
                                "By providing comprehensive reviews of the Masonry specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in masonry within the Technical and Vocational Education (TVE) field.");
                        break;
                    case "Carpentry":
                    	displayDescription("Carpentry Specialization Description:\n\n" +
                    	"The Carpentry specialization focuses on developing expertise in woodworking and construction of structures using timber and related materials. Students in this specialization learn various techniques for cutting, shaping, joining, and finishing wood to create a wide range of structures and architectural elements.\n\n" +
                    	"Real-world applications of the Carpentry specialization span across residential, commercial, and industrial construction projects. Carpenters are involved in building and installing frameworks, roofs, floors, doors, windows, and various interior and exterior features of buildings. Their craftsmanship contributes to the functionality, aesthetics, and structural integrity of diverse structures.\n\n" +
                    	"Industry relevance is paramount in the Carpentry specialization, as skilled carpenters are essential contributors to the construction industry. The knowledge and skills acquired in this specialization are in demand for meeting the needs of modern construction practices, including sustainable building techniques, use of eco-friendly materials, and adherence to safety regulations.\n\n" +
                    	"By providing comprehensive reviews of the Carpentry specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in carpentry within the Technical and Vocational Education (TVE) field.\n\n");
                        break;
                    case "Cookery":
                    	displayDescription("Cookery Specialization Description:\n\n" +
                    			"The Cookery specialization focuses on developing culinary skills and expertise in food preparation, cooking techniques, and kitchen management. Students in this specialization learn various cooking methods, culinary arts, food safety practices, nutrition principles, and menu planning.\n\n" +
                    			"Real-world applications of the Cookery specialization encompass a wide range of settings, including restaurants, hotels, catering services, healthcare facilities, cruise ships, and culinary education institutions. Cooks and chefs play a pivotal role in creating diverse and delicious dishes, catering to the preferences of customers and adhering to industry standards for quality and presentation.\n\n" +
                    			"Industry relevance is paramount in the Cookery specialization, as skilled cooks and chefs are in demand across the food service and hospitality sectors. The knowledge and skills acquired in this specialization are essential for meeting the evolving demands of the culinary industry, including trends in international cuisine, dietary preferences, and culinary innovation.\n\n" +
                    			"By providing comprehensive reviews of the Cookery specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in cookery within the Technical and Vocational Education (TVE) field.\n\n");
                        break;
                    case "Garments":
                    	displayDescription ("Garments Specialization Description:\n\n" +
                    			"The Garments specialization focuses on developing skills in garment design, production, and fashion industry practices. Students in this specialization learn various techniques for pattern making, fabric selection, cutting, sewing, and garment assembly, as well as principles of fashion design and styling.\n\n" +
                    			"Real-world applications of the Garments specialization encompass the fashion and textile industries, including apparel manufacturing, fashion design studios, textile mills, retail stores, and fashion houses. Garment workers contribute to the creation of diverse clothing items, ranging from everyday wear to haute couture, and play a crucial role in bringing fashion concepts to life.\n\n" +
                    			"Industry relevance is paramount in the Garments specialization, as skilled garment workers are essential contributors to the fashion and textile sectors. The knowledge and skills acquired in this specialization are in demand for meeting the needs of modern fashion trends, consumer preferences, sustainability practices, and technological advancements in garment manufacturing.\n\n" +
                    			"By providing comprehensive reviews of the Garments specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in garment making within the Technical and Vocational Education (TVE) field.\n\n");

                        break;
                    case "Plumbing":
                    	displayDescription ("Plumbing Specialization Description:\n\n" +
                    			"The Plumbing specialization focuses on developing skills in the installation, maintenance, and repair of plumbing systems used in residential, commercial, and industrial settings. Students in this specialization learn various techniques for pipefitting, fixture installation, water supply systems, drainage systems, and plumbing code compliance.\n\n" +
                    			"Real-world applications of the Plumbing specialization are essential for ensuring the functionality and safety of buildings and infrastructure. Plumbers play a critical role in constructing, maintaining, and repairing plumbing systems that provide clean water supply, remove wastewater, and facilitate efficient drainage. Their work contributes to the health, sanitation, and comfort of communities.\n\n" +
                    			"Industry relevance is paramount in the Plumbing specialization, as skilled plumbers are in demand across various sectors, including construction, maintenance services, municipal utilities, and facility management. The knowledge and skills acquired in this specialization are essential for addressing contemporary challenges such as water conservation, sustainable plumbing practices, and compliance with building codes and regulations.\n\n" +
                    			"By providing comprehensive reviews of the Plumbing specialization, this objective aims to highlight its real-world applications and industry relevance, empowering individuals to make informed decisions about pursuing a career in plumbing within the Technical and Vocational Education (TVE) field.\n\n");
                        break;
                    default:
                        break;
                }
            }
     
            if ("Skills Assessment and Gap Analysis".equals(selectedObjective)) {
                switch (specialization) {
                    case "Electricity":
                        displaySkillsAssessmentAndGapAnalysisElectricity();
                        break;
                    case "Masonry":
                        displaySkillsAssessmentAndGapAnalysisMasonry();
                        break;
                    case "Carpentry":
                        displaySkillsAssessmentAndGapAnalysisCarpentry();
                        break;
                    case "Cookery":
                        displaySkillsAssessmentAndGapAnalysisCookery();
                        break;
                    case "Garments":
                        displaySkillsAssessmentAndGapAnalysisGarments();
                        break;
                    case "Plumbing":
                        displaySkillsAssessmentAndGapAnalysisPlumbing();
                        break;
                    default:
                        break;
                }
            }
        }
    }

    private void displaySkillsAssessmentAndGapAnalysisElectricity() {
        String assessmentText = "Skills Assessment and Gap Analysis - Electricity Specialization:\n\n" +
                "1. Electrical Circuit Analysis: Assess the ability to analyze and troubleshoot electrical circuits, including understanding circuit diagrams, identifying components, and diagnosing faults.\n\n" +
                "2. Power Distribution Systems: Evaluate knowledge and skills related to power distribution systems, including understanding different voltage levels, distribution panel configurations, and safety protocols.\n\n" +
                "3. Wiring and Installation: Assess proficiency in wiring techniques, cable management, and installation practices for electrical components, switches, outlets, and fixtures.\n\n" +
                "4. Safety Protocols and Regulations: Evaluate knowledge of safety protocols and regulations related to electrical work, including proper grounding, insulation, and compliance with electrical codes and standards.\n\n" +
                "5. Hands-on Skills: Assess practical skills through hands-on tasks such as installing electrical fixtures, troubleshooting electrical faults, and safely handling electrical tools and equipment.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Electricity Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    private void displaySkillsAssessmentAndGapAnalysisMasonry() {
        String assessmentText = "Skills Assessment and Gap Analysis - Masonry Specialization:\n\n" +
                "1. Masonry Techniques: Evaluate proficiency in various masonry techniques, including bricklaying, block laying, stone masonry, and concrete work.\n\n" +
                "2. Structural Integrity: Assess understanding of structural principles and techniques for ensuring the stability, strength, and durability of masonry structures.\n\n" +
                "3. Material Selection and Preparation: Evaluate knowledge of different types of masonry materials, their properties, and appropriate methods for preparing and handling them.\n\n" +
                "4. Finishing and Detailing: Assess skills in finishing and detailing masonry work, including mortar joints, surface textures, and decorative elements.\n\n" +
                "5. Safety Practices: Evaluate adherence to safety practices and regulations specific to masonry work, including proper handling of tools, equipment, and materials, as well as fall protection measures.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Masonry Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    private void displaySkillsAssessmentAndGapAnalysisCarpentry() {
        String assessmentText = "Skills Assessment and Gap Analysis - Carpentry Specialization:\n\n" +
                "1. Woodworking Techniques: Evaluate proficiency in woodworking techniques, including cutting, shaping, joining, and finishing wood to specified dimensions and tolerances.\n\n" +
                "2. Structural Framing: Assess knowledge and skills related to structural framing, including building frames, roofs, floors, and partitions using timber and engineered wood products.\n\n" +
                "3. Cabinetry and Furniture Making: Evaluate skills in cabinetry and furniture making, including designing, constructing, and finishing custom cabinets, furniture pieces, and architectural millwork.\n\n" +
                "4. Blueprint Reading: Assess the ability to interpret and work from construction blueprints, drawings, and specifications relevant to carpentry projects.\n\n" +
                "5. Safety Procedures: Evaluate adherence to safety procedures and practices specific to carpentry work, including the proper use of personal protective equipment (PPE), tool safety, and hazard recognition.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Carpentry Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    private void displaySkillsAssessmentAndGapAnalysisCookery() {
        String assessmentText = "Skills Assessment and Gap Analysis - Cookery Specialization:\n\n" +
                "1. Culinary Techniques: Evaluate proficiency in fundamental culinary techniques, including knife skills, food preparation methods, cooking techniques, and presentation skills.\n\n" +
                "2. Menu Planning and Recipe Development: Assess skills in menu planning, recipe development, and creating balanced and innovative menus tailored to different cuisines and dietary preferences.\n\n" +
                "3. Food Safety and Sanitation: Evaluate knowledge of food safety principles, sanitation practices, and proper handling of food to prevent contamination and ensure food safety standards compliance.\n\n" +
                "4. Ingredient Selection and Procurement: Assess knowledge of ingredient selection, quality assessment, and procurement practices, including sourcing fresh and seasonal ingredients and maintaining inventory.\n\n" +
                "5. Kitchen Management: Evaluate skills in kitchen organization, workflow management, time management, and teamwork to ensure efficient and smooth operations in a culinary environment.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Cookery Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    private void displaySkillsAssessmentAndGapAnalysisGarments() {
        String assessmentText = "Skills Assessment and Gap Analysis - Garments Specialization:\n\n" +
                "1. Pattern Making and Cutting: Evaluate proficiency in pattern making, cutting, and fabric layout techniques to maximize material utilization and achieve accurate garment dimensions.\n\n" +
                "2. Sewing and Stitching: Assess skills in sewing, stitching, and garment assembly using various sewing machines, equipment, and techniques for different types of fabrics and garments.\n\n" +
                "3. Garment Fit and Finish: Evaluate attention to detail in achieving proper garment fit, finishing techniques, seam allowances, and decorative embellishments to enhance garment aesthetics.\n\n" +
                "4. Fashion Design Principles: Assess understanding of fashion design principles, trends, and styles relevant to garment construction, including silhouette, color theory, fabric manipulation, and garment embellishments.\n\n" +
                "5. Quality Control and Assurance: Evaluate adherence to quality control standards and procedures for inspecting, measuring, and evaluating garment construction quality, fit, and finish.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Garments Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    private void displaySkillsAssessmentAndGapAnalysisPlumbing() {
        String assessmentText = "Skills Assessment and Gap Analysis - Plumbing Specialization:\n\n" +
                "1. Pipefitting and Installation: Evaluate proficiency in pipefitting techniques, pipe joining methods, and installation practices for water supply, drainage, and plumbing fixtures.\n\n" +
                "2. Plumbing Systems: Assess understanding of plumbing systems, including water distribution systems, drainage systems, venting systems, and fixture connections, as well as troubleshooting skills for identifying and repairing plumbing issues.\n\n" +
                "3. Plumbing Codes and Regulations: Evaluate knowledge of plumbing codes, regulations, and standards relevant to plumbing installations, including compliance with building codes, safety regulations, and environmental requirements.\n\n" +
                "4. Pipe Material and Selection: Assess knowledge of different types of piping materials, their properties, and appropriate applications for water supply, drainage, and venting systems.\n\n" +
                "5. Safety Practices: Evaluate adherence to safety practices and procedures specific to plumbing work, including proper handling of tools, equipment, and materials, as well as precautions for preventing leaks, floods, and other plumbing emergencies.\n\n";

        JTextArea assessmentTextArea = new JTextArea(assessmentText);
        assessmentTextArea.setLineWrap(true);
        assessmentTextArea.setWrapStyleWord(true);
        assessmentTextArea.setEditable(false);
        assessmentTextArea.setFont(new Font("Arial", Font.PLAIN, 16));

        JScrollPane scrollPane = new JScrollPane(assessmentTextArea);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        JFrame assessmentFrame = new JFrame("Skills Assessment and Gap Analysis - Plumbing Specialization");
        assessmentFrame.add(scrollPane);
        assessmentFrame.setSize(800, 600);
        assessmentFrame.setLocationRelativeTo(null);
        assessmentFrame.setVisible(true);
    }
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new TVESpecializationGuide();
            }
        });
    }
}
