# Makefile helpers for common repo tasks

.PHONY: download-artifacts

# Download artifacts from a GitHub Actions run. Usage:
# make download-artifacts OWNER=org REPO=repo RUN_ID=123456 ARTIFACT_NAME=e2e-artifacts OUT_DIR=./tmp
download-artifacts:
	python scripts/download_artifacts.py \
		--owner $(OWNER) \
		--repo $(REPO) \
		--run-id $(RUN_ID) \
		--artifact-name $(ARTIFACT_NAME) \
		--out-dir $(OUT_DIR)
