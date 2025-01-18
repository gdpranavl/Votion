# Votion
**Vocal Journaling App**

---

## Description

The Vocal Journaling App is a productivity and mindfulness tool designed to help users manage their tasks, goals, and habits while incorporating voice-based journaling and meditation features. The app combines traditional task management with conversational AI, providing a unique experience for users to track their progress, stay organized, and maintain mental well-being.

### Key Features:
- **Speech-to-Text Journaling**: Record and transcribe voice entries for quick and easy journaling.
- **Task Management**: Organize tasks, goals, and events with a calendar view.
- **Meditation Guidance**: Interactive meditation tracking with adjustable breath cycles.
- **Data Visualization**: Graphical representation of progress and task completion.
- **Cross-Platform Support**: Seamless experience on iOS, Android, and web.

---

## Installation Instructions

### Prerequisites
- Node.js (v16 or later)
- npm or Yarn
- Flutter (for mobile app development)
- Git

### Steps
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/vocal-journaling-app.git
   cd vocal-journaling-app
   ```

2. **Install Dependencies:**
   For the backend:
   ```bash
   cd backend
   npm install
   ```
   For the frontend:
   ```bash
   cd frontend
   flutter pub get
   ```

3. **Set Up Environment Variables:**
   Create a `.env` file in the backend directory with the following:
   ```env
   PORT=5000
   MONGO_URI=your_mongodb_uri
   GOOGLE_API_KEY=your_google_cloud_api_key
   ```

4. **Run the Application:**
   Start the backend server:
   ```bash
   cd backend
   npm start
   ```
   Launch the frontend application:
   ```bash
   cd frontend
   flutter run
   ```

---

## Usage

### Running the App
1. Launch the application on your device or simulator.
2. Navigate through the main sections:
   - **Tasks**: Add or manage tasks and goals.
   - **Journaling**: Tap the microphone icon to record and transcribe a journal entry.
   - **Meditation**: Select a meditation type and adjust breath cycles.

### Example Code Snippet
Here’s how to call the speech-to-text API from the backend:
```javascript
const { SpeechClient } = require('@google-cloud/speech');

const client = new SpeechClient();

async function transcribeAudio(audioBuffer) {
  const request = {
    audio: { content: audioBuffer.toString('base64') },
    config: { encoding: 'LINEAR16', sampleRateHertz: 16000, languageCode: 'en-US' },
  };

  const [response] = await client.recognize(request);
  return response.results.map(result => result.alternatives[0].transcript).join('\n');
}
```

---

## Design Aspects

### Architecture
- **Frontend**: Built with Flutter for cross-platform compatibility.
- **Backend**: Node.js with Express for REST API support.
- **Database**: MongoDB for storing user data and journaling entries.
- **APIs**: Google Cloud Speech-to-Text for transcription and Firebase for authentication.

### Data Flow
1. **Input**: User interacts via voice or UI components.
2. **Processing**: Voice data is transcribed by the backend and stored in MongoDB.
3. **Output**: Processed data is displayed as text entries, progress graphs, or visual cues.

### User Interface
- **Design Principles**: Minimalist and high-contrast UI for better accessibility.
- **Tools**: Designed in Figma, implemented with Flutter widgets.
- **Libraries**: Utilizes packages like `provider` for state management and `flutter_chart` for visual data representation.

---

## Contributing

We welcome contributions to improve this project!

### Guidelines
1. Fork the repository and create a new branch:
   ```bash
   git checkout -b feature-name
   ```
2. Make changes and commit them with clear messages:
   ```bash
   git commit -m "Add new feature: description"
   ```
3. Push your branch and create a pull request:
   ```bash
   git push origin feature-name
   ```

### Reporting Issues
- Use the [issue tracker](https://github.com/your-username/vocal-journaling-app/issues) to report bugs or suggest features.

### Code of Conduct
- Be respectful and constructive in all communications.
- Adhere to the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/).

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact Information

For support or inquiries, reach out to:
- **Email**: support@vocaljournalingapp.com
- **GitHub Issues**: [https://github.com/your-username/vocal-journaling-app/issues](https://github.com/your-username/vocal-journaling-app/issues)
- **Twitter**: [@VocalJournalApp](https://twitter.com/VocalJournalApp)

