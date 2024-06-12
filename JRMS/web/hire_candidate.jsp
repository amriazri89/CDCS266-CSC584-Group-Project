<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hire Candidates</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles */
        body {
            position: relative;
            background-image: url('image/pexels-tima-miroshnichenko-5439137.jpg');
            /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Adjust the alpha value (0.5) to set the desired opacity level */
            z-index: -1;
            /* Place the overlay behind other content */
        }


        .container,
        footer {
            position: relative;
            /* Ensure container's children are positioned relative to it */
            z-index: 1;
            /* Move the container above the pseudo-element */
        }

        #candidate-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .candidate {
            width: calc(33.33% - 20px);
            background-color: #fff;
            padding: 30px;
            font-size: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 255, 0.1);
            border: 1px solid rgb(122, 122, 126);

        }

        .candidate:hover {
            box-shadow: 0 0 10px rgba(0, 0, 255, 0.3);
            /* Adjust the alpha value as needed */
        }

        .candidate h3 {
            margin-bottom: 10px;
        }

        .candidate p {
            margin-bottom: 5px;
        }

        .candidate button {
            background-color: #4C779F;
            color: #fff;
            border: none;
            font-size: 18px;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .candidate button:hover {
            background-color: #244C85;
        }

        h2 {
            color: whitesmoke;
            text-decoration: underline;
        }


        button.delete {
            background-color: #e12646;
            color: #fff;
            border: none;
            padding: 8px 19px;
            border-radius: 3px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        button.delete:hover {
            background-color: #822734;
        }

        /* Additional styles for the modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            /* Semi-transparent background */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            /* Center modal vertically and horizontally */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 60%;
            /* Adjust modal width as needed */
            max-width: 400px;
            /* Max width for larger screens */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        button {
            background-color: #4C779F;
            color: #fff;
            border: none;
            font-size: 18px;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #244C85;
        }

        input[type="date"]{
            padding:5px;
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <custom:navBar />
    <br> <br> <br> <br> <br> <br>

    <div class="container">


        <h2>List of Candidates</h2><br>
        <div id="candidate-list">
            <!-- Candidate information will be dynamically populated here -->
        </div>
    </div>

    <!-- Modal for approving candidates -->
    <div id="approveModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 style="color:#244C85;text-decoration: none;">Approve Candidate</h2><br>
            <b>Interview Date:</b>
            <input type="date" id="interviewDate">
            <button onclick="approveCandidate()" style="float:right;height:35px;">Submit</button>
        </div>
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // JavaScript code for fetching and displaying candidate data
        // Dummy data (replace with actual data fetching logic)
        var candidates = [
            { name: "Muhamad Amri Bin Azri", email: "john@example.com", position: "Software Developer" },
            { name: "Paan Bin Upin", email: "jane@example.com", position: "Data Analyst" },
            { name: "Ikhwan Bin Akhwan", email: "michael@example.com", position: "Marketing Specialist" }
            // Add more candidate objects as needed
        ];

        window.onload = function () {
            var candidateListContainer = document.getElementById("candidate-list");

            // Iterate through the candidate data and create HTML elements to display it
            candidates.forEach(function (candidate) {
                var candidateDiv = document.createElement("div");
                candidateDiv.classList.add("candidate");
                candidateDiv.innerHTML = `
                    <h3>${candidate.name}</h3>
                    <p>Email: ${candidate.email}</p>
                    <p>Position: ${candidate.position}</p>
                    <button onclick="openModal('${candidate.name}')">Approve</button>
                    <button class="delete" onclick="rejectCandidate('${candidate.name}')">Reject</button>
                `;
                candidateListContainer.appendChild(candidateDiv);
            });
        }

        // Function to open the approval modal
        function openModal(name) {
            var modal = document.getElementById("approveModal");
            modal.style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById("approveModal");
            modal.style.display = "none";
        }

        // Function to approve the candidate
        function approveCandidate() {
            var interviewDate = document.getElementById("interviewDate").value;
            alert("Candidate approved for interview on: " + interviewDate);
            closeModal();
        }

        // Function to reject the candidate (replace with actual rejection logic)
        function rejectCandidate(name) {
            alert("Candidate " + name + " rejected!");
        }

        // Close the modal when clicking outside of it
        window.onclick = function (event) {
            var modal = document.getElementById("approveModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>

</html>