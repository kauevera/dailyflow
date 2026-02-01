document.addEventListener("turbo:load", () => {
  console.log("O JavaScript do DailyFlow subiu!");
  const checkboxes = document.querySelectorAll(".task-status-checkbox");

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

  const searchInput = document.getElementById("task-search");
  
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

  const alerts = document.querySelectorAll(".flash-message");
  
  alerts.forEach(alert => {
    setTimeout(() => {
      alert.style.transition = "opacity 1s ease, transform 1s ease";
      alert.style.opacity = "0";
      alert.style.transform = "translateY(-20px)";
      setTimeout(() => alert.remove(), 1000);
    }, 4000);
  });
});