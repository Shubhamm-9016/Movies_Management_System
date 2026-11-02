function editMovie(movie) {
  document.getElementById("editForm").action = `/update/${movie.movie_id}`;
  document.getElementById("editTitle").value = movie.title;
  document.getElementById("editGenre").value = movie.genre;
  document.getElementById("editPrice").value = movie.price;
  document.getElementById("editDuration").value = movie.duration || "";
  document.getElementById("editLanguage").value = movie.language;
  document.getElementById("editModal").classList.add("show");
}
function closeModal() { document.getElementById("editModal").classList.remove("show"); }
document.getElementById("editModal").addEventListener("click", e => {
  if (e.target.id === "editModal") closeModal();
});
