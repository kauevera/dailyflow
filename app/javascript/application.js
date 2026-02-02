const initializeApp = () => {
  console.log("ok!");

  const checkboxes = document.querySelectorAll(".task-status-checkbox");
  const searchInput = document.getElementById("task-search");
  const alerts = document.querySelectorAll(".flash-message");
  
  // logica de alerta
  alerts.forEach(alert => {
    setTimeout(() => {
      alert.style.opacity = "0";
      setTimeout(() => alert.remove(), 1000);
    }, 2000);
  });  

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", (e) => {
      const taskId = e.target.dataset.taskId;
      const completed = e.target.checked;

      fetch(`/tasks/${taskId}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ task: { concluida: completed } })
      })
      .then(response => {
        if (response.ok) {
          const label = e.target.closest("tr").querySelector(".task-title");
          label.style.textDecoration = completed ? "line-through" : "none";
          label.style.opacity = completed ? "0.5" : "1";
        }
      });
    });
  });

  if (searchInput) {
    searchInput.addEventListener("keyup", () => {
      const filter = searchInput.value.toLowerCase();
      const rows = document.querySelectorAll("tbody tr");

      rows.forEach(row => {
        const text = row.querySelector(".task-title").innerText.toLowerCase();
        row.style.display = text.includes(filter) ? "" : "none";
      });
    });
  }
};

document.addEventListener("DOMContentLoaded", initializeApp);